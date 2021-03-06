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
import sys
import datetime as dt
import csv
import time
import os


class TemperatureTestSx5_TS(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        # Global settings/variables
        self._gv_scan_engine = gv().scan_engine_dict
        self._gs = gs().global_settings
        self._config_dict: dict

        # Modules Manager
        self._SX5: SX5_Manager
        self._image_manager: ImageManager
        self._serial: cs

        # Timers
        self._timer_dict = {
            'Global': Timer,
            'ReadTemp': Timer,
            'WaitToAcq': Timer,
            'FrameAcq': Timer
        }

        # Scan Engine Thread
        self._scan_engine_app_thread: CustomThread
        self._read_temperature_thread: CustomThread
        self._csv_log_thread: CustomThread

        # Dictionary for steps of iterations
        self._step_dict: dict = {}
        self._target_temp: float

        # Temperature
        self._temperature_dict = {
            'Room': {
                'command': 'read_env_temp\r',
                'value': 0.0
            },
            'ScanEngine': {
                'command': 'read_se_temp\r',
                'value': 0.0
            }
        }

        # Dictionary with state and "pointer to function" for the state machine
        self._temp_test_fun_dict = {
            enum.TempTestTS_StatesEnum.TT_INIT: self._init_state_manager,
            enum.TempTestTS_StatesEnum.TT_RUN_SCAN_ENGINE_APP: self._run_scan_engine_app_state_manager,
            enum.TempTestTS_StatesEnum.TT_READ_TEMP: self._read_temperature_state_manager,
            enum.TempTestTS_StatesEnum.TT_WAIT: self._wait_state_manager,
            enum.TempTestTS_StatesEnum.TT_UPDATE_TARGET: self._update_target_temp_state_manager,
            enum.TempTestTS_StatesEnum.TT_PULL_IMAGES: self._pull_images_state_manager,
            #enum.TempTestTS_StatesEnum.TT_CONVERT_IMAGES: self._convert_images_state_manager,
            enum.TempTestTS_StatesEnum.TT_STOP: self._stop_state_manager,
            enum.TempTestTS_StatesEnum.TT_ERROR: self._error_state_manager
        }

        # Initialize state machine to INIT state
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_INIT
        self._last_temp_test_state: enum.TempTestTS_StatesEnum

        self._csv_log_dict = {
            "filename": None,
            "file": None,
            "csv_writer": None,
            "log_data": {
                'time [s]': None,
                'room [°C]': None,
                'scan Engine [°C]': None,
            }
        }

        # Initialize Colorama library
        cm.init(autoreset=True)

        pass

    def _parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._gs['ConfigFile_TS_Test']).getroot())

        # Update the output directory field with the complete path
        self._config_dict["SX5"]["output_dir_name"] = os.getcwd() + "/" + self._config_dict["SX5"]["output_dir_name"]
        pass

    def _init_sx5(self):
        """ """
        dbg.debug(print, self._config_dict['SX5']['output_dir_name'], debug=self._gs['debug'])
        dbg.debug(print, int(self._config_dict['SX5']['num_of_frame']) * int(
                                    self._config_dict['SX5']['num_of_loop']), debug=self._gs['debug'])

        # Init an SX5 instance
        self._SX5 = SX5_Manager(scan_engine=self._config_dict['SX5']['scan_engine'],
                                num_frame=self._config_dict['SX5']['num_of_frame'],
                                num_loop=self._config_dict['SX5']['num_of_loop'],
                                num_save_files=int(self._config_dict['SX5']['num_of_frame']) * int(
                                    self._config_dict['SX5']['num_of_loop']),
                                callback_delay_ms=self._config_dict['SX5']['callback_delay_ms'],
                                frame_storage_dir=self._config_dict['SX5']['frame_storage_dir'],
                                pull_dir="",
                                )
        # Disable scan service
        self._SX5.disable_scan_service()
        pass

    def _init_temperature_sensor(self):
        """"""
        # TODO try except.... serial.serialutil.SerialException
        self._serial = cs.CustomSerial(port=self._config_dict['TempSensor']['port'],
                                       baudrate=self._config_dict['TempSensor']['baudrate'])
        self._serial.serial_init()
        self._serial.flushInput()
        self._serial.flushOutput()

        #self._serial.serial_write("init")

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
        self._target_temp = list(self._step_dict.values())

        pass

    def _init_output_directory(self):
        """"""
        try:
            # Check if output folder exist
            dir_files = os.listdir(self._config_dict["SX5"]["output_dir_name"])
        except FileNotFoundError:
            # Create folder if not exist
            os.mkdir(self._config_dict["SX5"]["output_dir_name"])
        else:
            # If output directory exist check if is empty
            if dir_files:
                input("Output directory is not empty: please choose another directory")
                sys.exit()
            else:
                pass

        pass

    def _init_image_manager(self):
        """"""
        self._image_manager = ImageManager(input_dir="",
                                           output_dir="",
                                           img_width=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']][
                                               'width'],
                                           img_height=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']][
                                               'height'],
                                           img_hw_acc_pixel=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']][
                                               'hw_acc_pixels'],
                                           out_ext=self._config_dict['ImageManager']['img_format'])

        pass

    def _init_timers(self):
        for timer in list(self._timer_dict):
            self._timer_dict[timer] = Timer()
        pass

    def _read_temperature_sensor_thread_runnable(self):
        """ Read temperature from all sensors """
        for sensor in list(self._temperature_dict.keys()):
            """"""
            temp = 0
            # Read temperature
            self._serial.reset_input_buffer()
            self._serial.serial_write(self._temperature_dict[sensor]['command'])
            while not self._serial.bytes_available_rx:
                pass
            try:
                temp = float(self._serial.serial_readline().strip("\r\n"))
            except:
                pass
            else:
                self._temperature_dict[sensor]['value'] = temp
            finally:
                time.sleep(0.0)
        return

    def _update_csv_log_runnable(self):
        """"""
        # Populate csv dictionary
        self._csv_log_dict['log_data']['time [s]'] = self._timer_dict['Global'].elapsed_time_s(digits=1)
        self._csv_log_dict["log_data"]['room [°C]'] = self._temperature_dict['Room']['value']
        self._csv_log_dict["log_data"]['scan Engine [°C]'] = self._temperature_dict['ScanEngine']['value']

        # Open csv
        self._csv_log_dict['file'] = open(file=self._csv_log_dict['filename'], mode='a', newline='')
        self._csv_log_dict['csv_writer'] = csv.writer(self._csv_log_dict['file'])

        # Update csv
        self._csv_log_dict['csv_writer'].writerow(self._csv_log_dict["log_data"].values())

        # Close csv
        self._csv_log_dict['file'].close()

        return

    def _update_directories(self):
        # Get the target temperature
        temp = self._target_temp[0]

        # Update ADB pull directory
        self._SX5.pull_dir = '{base_dir}/raw_T={temp}°C'.format(base_dir=self._config_dict['SX5']['output_dir_name'],
                                                                temp=temp)

        self._image_manager.input_dir = self._SX5.pull_dir

        # Update the converted images directory
        self._image_manager.output_dir = '{base_dir}/converted_T={temp}°C'.format(base_dir=self._config_dict['SX5']['output_dir_name'],
                                                                                  temp=temp)

        return

    def _store_last_state(self):
        # Store the last state machine state
        self._last_temp_test_state = self._temp_test_state

    def _kill_scan_engine_app(self):
        # Run a fake scan to close application
        sx5_dummy = SX5_Manager(scan_engine=self._config_dict['SX5']['scan_engine'],
                                num_frame=10,
                                num_loop=1,
                                num_save_files=0
                                )
        sx5_dummy.run_scan_engine_app()

        pass

    # ----------- State Machine Methods -----------
    def _init_state_manager(self):
        """"""
        dbg.debug(print, "Init State", debug=self._gs['debug'])

        # Parse config file
        self._parse_config_file()

        # Init directory
        self._init_output_directory()

        # Init SX5
        self._init_sx5()

        # Init Temperature Sensor
        self._init_temperature_sensor()

        # Init Image Manager
        self._init_image_manager()

        # Init Timers
        self._init_timers()

        # Init Step Dictionary
        self._init_step_dictionary()

        # Update Directories
        self._update_directories()

        # Init Threads
        self._scan_engine_app_thread = CustomThread(thread_name="ScanEngineThread",
                                                    runnable=self._SX5.run_scan_engine_app,
                                                    num_of_iter=1)

        self._read_temperature_thread = CustomThread(thread_name="ReadTemperatureThread",
                                                     runnable=self._read_temperature_sensor_thread_runnable,
                                                     timing_ms=500,
                                                     num_of_iter='inf')

        self._csv_log_thread = CustomThread(thread_name="CsvLogThread",
                                            runnable=self._update_csv_log_runnable,
                                            timing_ms=float(self._config_dict["Log"]["sample_time_s"])*1000,
                                            num_of_iter='inf')

        # Create CSV Log file
        self._csv_log_dict['filename'] = self._config_dict['SX5']['output_dir_name'] + "/" + self._config_dict['Log']['csv_filename']
        self._csv_log_dict['file'] = open(file=self._csv_log_dict['filename'], mode='w', newline='')
        self._csv_log_dict['csv_writer'] = csv.writer(self._csv_log_dict['file'])
        self._csv_log_dict['csv_writer'].writerow(self._csv_log_dict["log_data"].keys())
        self._csv_log_dict['file'].close()

        # Go to Run scan engine app state
        self._SX5.clear_frame_storage_dir()
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_RUN_SCAN_ENGINE_APP

        return

    def _run_scan_engine_app_state_manager(self):
        """"""
        dbg.debug(print, "-Run Scan Engine App", debug=self._gs['debug'])

        # Start Timer and run Scan Engine App Thread
        self._timer_dict['Global'].start()

        # Start threads
        self._scan_engine_app_thread.start()
        self._read_temperature_thread.start()
        self._csv_log_thread.start()

        # Store the last state
        self._store_last_state()

        # Go to Read Temperature state
        self._temp_test_state = enum.TempTestTS_StatesEnum.TT_READ_TEMP

        return

    def _read_temperature_state_manager(self):
        """"""
        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_READ_TEMP and
                self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_READ_TEMP):
            # Print the current temperature
            print(cm.Fore.CYAN + cm.Style.DIM + "\n--- Test @ {temp}°C ---".format(temp=self._target_temp[0]))
            # Start local timer to sample temperature every 1 second
            self._timer_dict['ReadTemp'].start()

            # Store the last state
            self._store_last_state()

        else:
            if (self._timer_dict['ReadTemp'].elapsed_time_s() >= int(self._config_dict['TempSensor']['sample_time_s'])):

                sys.stdout.write("\033[K")  # Clear to the end of line
                print("Detected temperatures: Room= {room}°C\t Scan Engine= {se}°C".format(room=self._temperature_dict['Room']['value'],
                                                                                           se=self._temperature_dict['ScanEngine']['value']), end="\r")

                if self._temperature_dict['Room']['value'] >= self._target_temp[0]:

                    # Stop timer
                    self._timer_dict['ReadTemp'].stop()

                    # Store the last state
                    self._store_last_state()

                    # Go to wait state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_WAIT
                else:
                    # Reset timer
                    self._timer_dict['ReadTemp'].reset()
        return

    def _wait_state_manager(self):
        """ """
        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_WAIT and
                self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_WAIT):
            sys.stdout.write("\033[K")  # Clear to the end of line
            print("- Reached target {sp}°C in the room: wait until scan engine reached the same temperature before acquire frames". \
                  format(sp=self._target_temp[0]))

            # Start local timer to sample temperature every 1 second
            self._timer_dict['ReadTemp'].start()

            # Store the last state
            self._store_last_state()
        else:
            if (self._timer_dict['ReadTemp'].elapsed_time_s() >= int(self._config_dict['TempSensor']['sample_time_s'])):

                sys.stdout.write("\033[K")  # Clear to the end of line
                print("Detected temperatures: Room= {room}°C\t Scan Engine= {se}°C".format(
                        room=self._temperature_dict['Room']['value'],
                        se=self._temperature_dict['ScanEngine']['value']), end="\r")

                if self._temperature_dict['ScanEngine']['value'] >= self._target_temp[0]:

                    sys.stdout.write("\033[K")
                    print("- Reached target {sp}°C on the scan engine".format(sp=self._target_temp[0]))

                    self._kill_scan_engine_app()
                    self._scan_engine_app_thread = CustomThread(thread_name="ScanEngineThread",
                                                                runnable=self._SX5.run_scan_engine_app,
                                                                num_of_iter=1)

                    # Discard all frames on SX5 before the frame acquisition time
                    self._SX5.clear_frame_storage_dir()
                    self._scan_engine_app_thread.start()

                    # Stop timer
                    self._timer_dict['ReadTemp'].stop()

                    # Store the last state
                    self._store_last_state()

                    # Go to wait state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_PULL_IMAGES
                else:
                    # Reset timer
                    self._timer_dict['ReadTemp'].reset()
        pass

    def _pull_images_state_manager(self):
        """"""
        if (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_PULL_IMAGES and
            self._last_temp_test_state != enum.TempTestTS_StatesEnum.TT_PULL_IMAGES):

            print("- Acquire frames for {time} minutes"\
                  .format(time=self._config_dict['Acquisition']['frame_acquisition_time_min']))

            # Stop the timer to wait the frame acquisition
            self._timer_dict['FrameAcq'].start()

            # Store the last state
            self._store_last_state()

        else:
            elapsed_time_min = self._timer_dict['FrameAcq'].elapsed_time_min(digits=3)

            print("\t Time: " + str(dt.timedelta(minutes=elapsed_time_min)).split('.')[0], end="\r")

            # When the time elapsed, download all frames acquired in this time interval and covert
            if (elapsed_time_min >= float(self._config_dict['Acquisition']['frame_acquisition_time_min'])):

                # Pull image from device and clear the device's directory
                print("- Download frames in {dir}".format(dir=self._SX5.pull_dir))
                ret = self._SX5.pull_images()

                # Convert the pulled images
                print("- Convert frames from .raw to {fmt} in {dir}".format(fmt=self._image_manager.output_file_ext,
                                                                            dir=self._image_manager.output_dir))
                self._image_manager.convert_images(show=False, save=True)

                if ret:
                    # Stop timer
                    self._timer_dict['FrameAcq'].stop()

                    # Store the last state
                    self._store_last_state()

                    # Go to stop state
                    self._temp_test_state = enum.TempTestTS_StatesEnum.TT_UPDATE_TARGET
                else:
                    # Stop timer
                    self._timer_dict['FrameAcq'].stop()

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

        except IndexError:
            # There is no other target temperature.

            # Store the last state
            self._store_last_state()

            # Go to stop state
            self._temp_test_state = enum.TempTestTS_StatesEnum.TT_STOP

        else:
            # Store the last state
            self._store_last_state()

            # Go to Read temperature state with new target temperature
            self._temp_test_state = enum.TempTestTS_StatesEnum.TT_READ_TEMP

        pass

    def _convert_images_state_manager(self):

        pass

    def _stop_state_manager(self):
        """"""
        dbg.debug(print, "Stop State", debug=self._gs['debug'])
        # Store the last state
        self._store_last_state()

        self._kill_scan_engine_app()

        # Stop read temperature thread
        self._read_temperature_thread.stop()
        self._csv_log_thread.stop()
        self._scan_engine_app_thread.stop()

        pass

    def _error_state_manager(self):
        """"""
        dbg.debug(print, "Error State", debug=self._gs['debug'])

        # Store the last state
        self._store_last_state()

        # Go to stop state
        self._temp_test_state = enum.TempTestStatesEnum.TT_STOP
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
        # Initialize execution timer
        ex_timer = Timer()
        ex_timer.start()

        while not (self._temp_test_state == enum.TempTestTS_StatesEnum.TT_STOP and
                   self._last_temp_test_state == self._temp_test_state):
            # Execute State Machine every 10ms
            if ex_timer.elapsed_time_ms() >= 10:
                # Execute the state machine at the current state
                self._temperature_test_state_machine_manager()
                # Reset timer
                ex_timer.reset()
            else:
                pass

        print(cm.Fore.CYAN + cm.Style.DIM + "\n-----------------")
        print(cm.Fore.CYAN + cm.Style.DIM + "--- Finished! ---")
        os._exit(0)


if __name__ == '__main__':
    test = TemperatureTestSx5_TS()
    test.run_test()