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



class TemperatureTestSx5(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        # Global settings/variables
        self._gv_scan_engine = gv().scan_engine_dict
        self._gs = gs().global_settings

        self._config_file = 'Config.xml'
        self._config_dict = None
        self._SX5 = None
        self._image_manager = None

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

        self._num_iter = 10 #TODO DELETE

        pass

    def _parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._config_file).getroot())

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
        print ("Init State")
        # Parse config file
        self._parse_config_file()
        # Init SX5
        self._init_sx5()
        # Init Image Manager
        self._init_image_manager()

        # Go to Run scan engine app state
        self._temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP
        return

    def _run_scan_engine_app_state_manager(self):
        print("Scan Engine App State")
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
        print("Pull Images State")
        # Pull image from device and clear the directory

        # TODO: aggiungere la gestione degli errori

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
        print ("ERROR state")
        self._temp_test_state = enum.TempTestStatesEnum.TT_STOP
        pass

    def _stop_state_manager(self):
        print ("STOP state")
        pass

    def _temperature_test_state_machine_manager(self, machine_state):
        # Get function from dictionary
        fun = self._temp_test_fun_dict.get(self._temp_test_state)

        # Execute function
        fun()
        return

    def _update_directories(self, step):
        self._SX5.pull_dir = '{base_dir}{num}'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                      num=step)
        self._image_manager.input_dir = '{base_dir}{num}'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                                 num=step)

        self._image_manager.output_dir = '{base_dir}{num}'.format(
            base_dir=self._config_dict['ImageManager']['output_dir'],
            num=step)


    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def run_test(self):
        """ """
        # Initialize all
        self._temperature_test_state_machine_manager(self._temp_test_state)


        for step in range (int(self._config_dict['ThermalChamber']['steps'])):
            print ("Step n° " + str(step))

            while not (self._temp_test_state == enum.TempTestStatesEnum.TT_STOP and
                       self._last_temp_test_state == self._temp_test_state):

                # Execute the state machine at the current state
                self._temperature_test_state_machine_manager(self._temp_test_state)

                # Store the last state machine state
                self._last_temp_test_state = self._temp_test_state

            # From the second iteration bypass the initialization and go to "run_scan_engine_app" state
            self._temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP
            self._last_temp_test_state = enum.TempTestStatesEnum.TT_RUN_SCAN_ENGINE_APP

            # Update Directories
            self._update_directories(step+1)



if __name__ == '__main__':
    test=TemperatureTestSx5()
    test.run_test()