import os
import subprocess
from GlobalVariables import GlobalVariables as gv
import signal

class SX5_Manager(object):
    """ """
    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self,
                 scan_engine=None,
                 num_loop=None,
                 num_frame=None,
                 num_save_files=None,
                 callback_delay_ms=None,
                 pull_dir=None,
                 frame_storage_dir=None):
        """ Constructor"""

        # Import Global Variables
        self._gv_scan_engine = gv().scan_engine_dict

        # Scan Engine App Variables
        self._scan_app = self._gv_scan_engine[scan_engine]['app']
        self._num_frame = num_frame
        self._num_save_files = num_save_files
        self._num_loop = num_loop
        self._callback_delay_ms = callback_delay_ms

        # Directory Variables
        self._frame_storage_dir = frame_storage_dir
        self._pull_dir = '"{pull_dir}"'.format(pull_dir=pull_dir)  # insert "" for adb purpose

        self._scan_engine_process = None
    # ************************************************* #
    # **************** Public Methods ***************** #
    # ************************************************* #
    def run_scan_engine_app(self):
        """ Launch the scan engine app on the device """
        # Return value
        ret = False
        check_string = 'finished'

        # Concatenate the scan command
        scan_command = "{scan_app} -l {num_loop} -n {num_frame} -s {num_save_files} -d {callback_delay_ms}".\
            format(scan_app=self._scan_app,
                   num_loop=self._num_loop,
                   num_frame=self._num_frame,
                   num_save_files=self._num_save_files,
                   callback_delay_ms=self._callback_delay_ms)

        # Run the scan command
        self._scan_engine_process = subprocess.Popen("adb shell", stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=False)
        scan_engine_stdout = self._scan_engine_process.communicate(scan_command.encode())[0].decode('ascii', errors='ignore')
        self._scan_engine_process.kill() #Close Process

        if (scan_engine_stdout.find(check_string) != -1):
            ret = True
        else:
            pass

        return ret

    # def stop_scan_engine_app(self):
    #     self._scan_engine_process.send_signal(signal.CTRL_BREAK_EVENT)
    #     return

    def pull_images(self):
        """ Run the "adb pull" command to download all frames """
        # Variables
        check_string = 'pulled, 0 skipped'  # Control string

        # Concatenate Pull command
        pull_command = "adb pull {frame_storage_dir} {pull_dir}".\
            format(frame_storage_dir=self._frame_storage_dir,
                   pull_dir=self._pull_dir)

        # ADB Pull
        pull_process = subprocess.check_output(pull_command)
        pull_process_stdout = pull_process.decode('ascii', errors='ignore')

        if (pull_process_stdout.find(check_string) != -1):
            ret = True
        else:
            pass

        return ret

    def clear_frame_storage_dir(self):
        """ Clear the frame storage folder on the device """
        # Variables
        check_string = "No such file or directory"  # Control string
        ret = False  # return value

        # Concatenate Delete Command
        delete_cmd = "rm -v /{dir}/*".format(dir=self._frame_storage_dir)  # Delete command

        # Run the delete command
        delete_process = subprocess.Popen("adb shell", stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=False)
        delete_process_stdout = delete_process.communicate(delete_cmd.encode())[0].decode('ascii', errors='ignore')
        delete_process.terminate() # Close process

        if (delete_process_stdout.find(check_string) == -1):
            ret = True

        return ret


    @property
    def pull_dir(self):
        return self._pull_dir

    @pull_dir.setter
    def pull_dir(self, directory):
        self._pull_dir = '"{pull_dir}"'.format(pull_dir=directory)  # insert "" for adb purpose


if __name__ == "__main__":
    import time
    # Get Current working directory and set the pull directory
    current_dir = os.getcwd()
    adb_pull_dir = '{current_dir}/test/download/'.format(current_dir=current_dir)

    test = SX5_Manager(scan_engine='halogen1',
                       num_frame=10,
                       num_loop=3,
                       num_save_files=30,
                       frame_storage_dir='data/local/tmp',
                       pull_dir=adb_pull_dir)
    test.run_scan_engine_app()
   # time.sleep(10)
    #test.stop_scan_engine_app()

    test.pull_images()

    test.clear_frame_storage_dir()