#!/usr/bin/env python

import sys
import os
from Parser import Parser
from SX5_Manager import SX5_Manager
from ParseXml import XmlDictConfig
from xml.etree import ElementTree
from ImageManager import ImageManager
from GlobalVariables import GlobalVariables as gv
from GlobalVariables import GlobalSettings as gs
from GlobalVariables import Enumerations as enum
from Debug import Debug as dbg
import colorama as cm


class TemperatureTestSx5(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        # Global settings/variables
        self._gv_scan_engine = gv().scan_engine_dict
        self._gs = gs().global_settings
        self._config_dict = {}

        # Modules Manager
        self._SX5 = None
        self._image_manager = None
        self._thermal_chamber = None

        # Dictionary for steps of iterations
        self._step_dict = {}

        # Dictionary with state and "pointer to function" for the state machine
        self._temp_test_fun_dict = {
            enum.TempTestStatesEnum.TT_INIT: self._init_state_manager,
            enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP: self._run_scan_engine_app_state_manager,
            enum.TempTestStatesEnum.TT_PULL_IMAGES: self._pull_images_state_manager,
            enum.TempTestStatesEnum.TT_ERROR: self._error_state_manager,
            enum.TempTestStatesEnum.TT_STOP: self._stop_state_manager
        }

        # Initialize state machine to INIT state
        self._temp_test_state = enum.TempTestStatesEnum.TT_INIT
        self._last_temp_test_state = None

        # Initialize Colorama library
        cm.init(autoreset=True)

        pass

    def _parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._gs['Config File']).getroot())

        pass

    def _init_sx5(self):
        """ """

        dbg.debug(print, self._config_dict['SX5']['adb_pull_base_dir'], debug=self._gs['debug'])

        # Init an SX5 instance
        self._SX5 = SX5_Manager(scan_engine=self._config_dict['SX5']['scan_engine'],
                                num_frame=self._config_dict['SX5']['num_of_frame'],
                                num_loop=self._config_dict['SX5']['num_of_loop'],
                                num_save_files=self._config_dict['SX5']['num_of_save_files'],
                                frame_storage_dir=self._config_dict['SX5']['frame_storage_dir'],
                                pull_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                )
        pass

    def _init_thermal_chamber(self):
        """"""
        start_temp = int(self._config_dict['ThermalChamber']['temp_start'])
        stop_temp = int(self._config_dict['ThermalChamber']['temp_stop'])
        steps = int( self._config_dict['ThermalChamber']['steps'])

        step_size = (stop_temp - start_temp) / (steps-1)

        for i in range(steps):
            self._step_dict['Step ' + str(i)] = start_temp + (step_size*i)
            
        pass

    def _init_image_manager(self):

        self._image_manager = ImageManager(input_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                           output_dir=self._config_dict['ImageManager']['output_dir'],
                                           img_width=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']]['width'],
                                           img_height=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']]['height'],
                                           out_ext=self._config_dict['ImageManager']['img_format'])

        pass

    # ----------- State Machine Methods -----------
    def _init_state_manager(self):
        """"""
        dbg.debug(print, "Init State", debug=self._gs['debug'])

        # Parse config file
        self._parse_config_file()
        # Init SX5
        self._init_sx5()

        # Init Thermal Chamber
        self._init_thermal_chamber()

        # Init Image Manager
        self._init_image_manager()

        # Go to Run scan engine app state
        self._temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP
        return

    def _run_scan_engine_app_state_manager(self):
        """"""
        print ("-Run Scan Engine App")
        dbg.debug(print, "Run Scan Engine App ", debug=self._gs['debug'])

        # Run Scan Engine App
        ret = self._SX5.run_scan_engine_app()

        if ret == True:
            # Go to pull images state
            self._temp_test_state = enum.TempTestStatesEnum.TT_PULL_IMAGES
        else:
            # Go to error state
            self._temp_test_state = enum.TempTestStatesEnum.TT_ERROR
            return

    def _pull_images_state_manager(self):
        """"""
        dbg.debug(print, "Pull Images", debug=self._gs['debug'])
        print("-Pull images")

        # TODO: aggiungere la gestione degli errori

        # Pull image from device and clear the directory
        ret = self._SX5.pull_images()
        self._SX5.clear_frame_storage_dir()

        # Convert the pulled images
        self._image_manager.convert_images(show=False, save=True)

        if ret == True:
            # Go to stop state
            self._temp_test_state = enum.TempTestStatesEnum.TT_STOP
        else:
            # Go to error state
            self._temp_test_state = enum.TempTestStatesEnum.TT_ERROR

        return

    def _error_state_manager(self):
        """"""
        dbg.debug(print, "Error State", debug=self._gs['debug'])
        self._temp_test_state = enum.TempTestStatesEnum.TT_STOP
        pass

    def _stop_state_manager(self):
        """"""
        dbg.debug(print, "Stop State", debug=self._gs['debug'])
        print("-Finished!")
        pass

    def _temperature_test_state_machine_manager(self):
        # Get function from dictionary
        fun = self._temp_test_fun_dict.get(self._temp_test_state)

        # Execute function
        fun()
        return

    def _update_directories(self, step):
        # Update ADB pull directory
        self._SX5.pull_dir = '{base_dir}_T={step}°C'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                            step=step)
        self._image_manager.input_dir = '{base_dir}_T={step}°C'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                                       step=step)

        # Update the converted images directory
        self._image_manager.output_dir = '{base_dir}_T={step}°C'.format(
            base_dir=self._config_dict['ImageManager']['output_dir'],
            step=step)


    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def run_test(self):
        """ """
        # Initialize all
        self._temperature_test_state_machine_manager()

        # Loop over temperature step dictionary
        for step in self._step_dict:
            # Update Directories
            self._update_directories(self._step_dict[step])

            print(cm.Fore.BLUE + '-- {step_key}: T={step_value}°C --'.format(step_key=step,
                                                                             step_value=self._step_dict[step]))


            while not (self._temp_test_state == enum.TempTestStatesEnum.TT_STOP and
                       self._last_temp_test_state == self._temp_test_state):

                # Store the last state machine state
                self._last_temp_test_state = self._temp_test_state

                # Execute the state machine at the current state
                self._temperature_test_state_machine_manager()

            # From the second iteration bypass the initialization and go to "run_scan_engine_app" state
            self._temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP
            self._last_temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP

            # Update Directories
            self._update_directories(self._step_dict[step])



if __name__ == '__main__':
    test = TemperatureTestSx5()
    test.run_test()