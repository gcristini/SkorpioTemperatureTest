#!/usr/bin/env python

from SX5_Manager import SX5_Manager
from ParseXml import XmlDictConfig
from xml.etree import ElementTree
from ImageManager import ImageManager
from GlobalVariables import GlobalVariables as gv
from GlobalVariables import GlobalSettings as gs
from GlobalVariables import Enumerations as enum
from Debug import Debug as dbg
import colorama as cm
from Timer import Timer
from CustomThread import CustomThread
import CustomSerial as cs

class TemperatureTestSx5_TS(object):
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
        self._serial = None

        # Timers
        self._global_timer = None
        self._read_temp_timer = None
        self._wait_to_acq_timer = None
        self._frame_acquisition_timer = None

        # Scan Engine Thread
        self._scan_engine_app_thread = None

        # Dictionary for steps of iterations
        self._step_dict = {}
        self._target_temp = None

        # Temperature
        self._room_temperature = None

        # Dictionary with state and "pointer to function" for the state machine
        self._temp_test_fun_dict = {
            enum.TempTestTS_StatesEnum.TT_INIT: self._init_state_manager,
            enum.TempTestTS_StatesEnum.TT_RUN_SCAN_ENGINE_APP: self._run_scan_engine_app_state_manager,
            enum.TempTestTS_StatesEnum.TT_READ_TEMP: self._read_temperature_state_manager,
            enum.TempTestTS_StatesEnum.TT_WAIT: self._wait_state_manager,
            enum.TempTestTS_StatesEnum.TT_UPDATE: self._update_target_temp_state_manager,
            enum.TempTestTS_StatesEnum.TT_PULL_IMAGES: self._pull_images_state_manager,
            enum.TempTestTS_StatesEnum.TT_ERROR: self._error_state_manager,
            enum.TempTestTS_StatesEnum.TT_STOP: self._stop_state_manager
        }

        # Initialize state machine to INIT state
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_INIT
        self._last_temp_test_state = None

        # Initialize Colorama library
        cm.init(autoreset=True)

        pass

    def _parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._gs['ConfigFile_TS_Test']).getroot())

        pass

    def _init_sx5(self):
        """ """

        dbg.debug(print, self._config_dict['SX5']['adb_pull_base_dir'], debug=self._gs['debug'])
        print (int(self._config_dict['SX5']['num_of_frame']) * int(
                                    self._config_dict['SX5']['num_of_loop']))

        # Init an SX5 instance
        self._SX5 = SX5_Manager(scan_engine=self._config_dict['SX5']['scan_engine'],
                                num_frame=self._config_dict['SX5']['num_of_frame'],
                                num_loop=self._config_dict['SX5']['num_of_loop'],
                                num_save_files=int(self._config_dict['SX5']['num_of_frame']) * int(
                                    self._config_dict['SX5']['num_of_loop']),
                                frame_storage_dir=self._config_dict['SX5']['frame_storage_dir'],
                                pull_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                )
        pass

    def _init_temperature_sensor(self):
        """"""
        # try except.... serial.serialutil.SerialException
        self._serial = cs.CustomSerial(port=self._config_dict['TempSensor']['port'],
                                       baudrate=self._config_dict['TempSensor']['baudrate'])
        self._serial.serial_init()
        self._serial.serial_write("init")

        pass

    def _init_step_dictionary(self):
        """"""
        start_temp = int(self._config_dict['ThermalChamber']['temp_start'])
        stop_temp = int(self._config_dict['ThermalChamber']['temp_stop'])
        steps = int(self._config_dict['ThermalChamber']['steps'])
        step_size = 0

        if steps > 1:
            step_size = (stop_temp - start_temp) / (steps - 1)
        elif steps == 1:
            step_size = 0
        else:
            print("Number of steps must be equal or greater than 1")

        # Create Dictionary rounding temperature to two decimal digits
        for i in range(steps):
            self._step_dict['Step ' + str(i)] = round(start_temp + (step_size * i), 2)

        # Copy all values from dictionary in a list with all targets temperature
        self._target_temp=list(self._step_dict.values())

        pass

    def _init_image_manager(self):

        self._image_manager = ImageManager(input_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                           output_dir=self._config_dict['ImageManager']['output_dir'],
                                           img_width=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']][
                                               'width'],
                                           img_height=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']][
                                               'height'],
                                           out_ext=self._config_dict['ImageManager']['img_format'])

        pass

    def _init_global_timer(self):
        self._global_timer = Timer()

        pass

    def _update_directories(self):
        # Get the target temperature
        temp = self._target_temp[0]

        # Update ADB pull directory
        self._SX5.pull_dir = '{base_dir}_T={temp}°C'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                            temp=temp)
        self._image_manager.input_dir = '{base_dir}_T={temp}°C'.format(base_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                                                       temp=temp)

        # Update the converted images directory
        self._image_manager.output_dir = '{base_dir}_T={temp}°C'.format(base_dir=self._config_dict['ImageManager']['output_dir'],
                                                                        temp=temp)

        return

    def _store_last_state(self):
        # Store the last state machine state
        self._last_temp_test_state = self._temp_test_state

    # ----------- State Machine Methods -----------
    def _init_state_manager(self):
        """"""
        dbg.debug(print, "Init State", debug=self._gs['debug'])

        # Parse config file
        self._parse_config_file()

        # Init SX5
        self._init_sx5()

        # Init Temperature Sensor
        self._init_temperature_sensor()

        # Init Image Manager
        self._init_image_manager()

        # Init Timer
        self._init_global_timer()

        # Init Step Dictionary
        self._init_step_dictionary()

        # Update Directories
        self._update_directories()

        # Go to Run scan engine app state
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_RUN_SCAN_ENGINE_APP

        return

    def _run_scan_engine_app_state_manager(self):
        """"""
        print("-Run Scan Engine App")

        # Start Timer and run and run Scan Engine App Thread
        self._global_timer.start()
        self._scan_engine_app_thread = CustomThread(runnable=self._SX5.run_scan_engine_app,
                                                    num_of_iter=1)
        self._scan_engine_app_thread.start()

        # Store the last state
        self._store_last_state()

        # Go to Read Temperature state
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_READ_TEMP

        return

    def _read_temperature_state_manager(self):
        """"""

        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_READ_TEMP and
            self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_READ_TEMP):

            # Create and run local timer to sample temperature every 1 second
            self._read_temp_timer = Timer()
            self._read_temp_timer.start()

            # Store the last state
            self._store_last_state()

        else:
            if (self._read_temp_timer.elapsed_time >= int(self._config_dict['TempSensor']['sample_time_s'])):

                # Read temperature
                self._serial.serial_write("read_temp")
                while not (self._serial.bytes_available_rx):
                    #print ("wait...")
                    pass

                self._room_temperature = int(self._serial.serial_read().strip("\r\n"))

                print("Temperature: {temp}°C".format(temp=self._room_temperature))

                if (self._room_temperature >= self._target_temp[0]):

                    # Store the last state
                    self._store_last_state()

                    # Go to wait state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_WAIT
                else:
                    # Reset timer
                    self._read_temp_timer.reset()

        return

    def _wait_state_manager(self):
        """ """
        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_WAIT and
            self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_WAIT):

            print("Wait...{time}s".format(time=self._config_dict['Acquisition']['wait_to_acq_time_s']))

            # Create and start the timer to wait the frame acquisition
            self._wait_to_acq_timer = Timer()
            self._wait_to_acq_timer.start()

            # Store the last state
            self._store_last_state()

        else:
            if (self._wait_to_acq_timer.elapsed_time >= int(self._config_dict['Acquisition']['wait_to_acq_time_s'])):

                # Discard all frame on SX5 before the frame acquisition time
                self._SX5.clear_frame_storage_dir()

                # Store the last state
                self._store_last_state()

                # Go to Pull Images
                self._temp_test_state = enum.TempTestTS_StatesEnum.TT_PULL_IMAGES

        return

    def _pull_images_state_manager(self):
        """"""
        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_PULL_IMAGES and
            self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_PULL_IMAGES):

            print("Wait...{time}s".format(time=self._config_dict['Acquisition']['frame_acquisition_time_s']))

            # Create and start the timer to wait the frame acquisition
            self._frame_acquisition_timer = Timer()
            self._frame_acquisition_timer.start()

            # Store the last state
            self._store_last_state()

        else:
            # When the time elapsed, download all frames acquired in this time interval
            if (self._frame_acquisition_timer.elapsed_time >= int(self._config_dict['Acquisition']['frame_acquisition_time_s'])):
                print("-Pull images")
                dbg.debug(print, self._frame_acquisition_timer.elapsed_time, debug=self._gs['debug'])

                # Pull image from device and clear the directory
                ret = self._SX5.pull_images()
                self._SX5.clear_frame_storage_dir()

                # Convert the pulled images
                #self._image_manager.convert_images(show=False, save=True)

                if ret == True:
                    # Store the last state
                    self._store_last_state()

                    # Go to stop state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_UPDATE
                else:
                    # Store the last state
                    self._store_last_state()

                    # Go to error state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_ERROR
        return

    def _update_target_temp_state_manager(self):
        """"""
        try:
            # Delete the first element of the list
            self._target_temp.pop(0)

            # Update directories
            self._update_directories()

            # Store the last state
            self._store_last_state()

            # Go to Read temperature state with new target temperature
            self._temp_test_state = enum.TempTestTS_StatesEnum.TT_READ_TEMP
        except IndexError:
            # There is no other target temperature.

            # Store the last state
            self._store_last_state()

            # Go to stop state
            self._temp_test_state = enum.TempTestTS_StatesEnum.TT_STOP

        pass

    def _error_state_manager(self):
        """"""
        dbg.debug(print, "Error State", debug=self._gs['debug'])

        # Store the last state
        self._store_last_state()

        # Go to stop state
        self._temp_test_state = enum.TempTestStatesEnum.TT_STOP
        pass

    def _stop_state_manager(self):
        """"""
        dbg.debug(print, "Stop State", debug=self._gs['debug'])
        # Store the last state
        self._store_last_state()
        print("-Finished!")

        # TODO: Kill app process ???
        pass

    def _temperature_test_state_machine_manager(self):
        # Get function from dictionary
        fun = self._temp_test_fun_dict.get(self._temp_test_state)

        # Execute function
        fun()
        return


    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def run_test(self):
        """ """
        # Initialize all
        #self._init_state_manager()

        while not (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_STOP and
                   self._last_temp_test_state == self._temp_test_state):

            # Execute the state machine at the current state
            self._temperature_test_state_machine_manager()


if __name__ == '__main__':
    test = TemperatureTestSx5_TS()
    test.run_test()