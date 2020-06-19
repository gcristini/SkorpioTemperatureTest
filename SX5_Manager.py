import os
import subprocess
from GlobalVariables import GlobalVariables as gv

class SX5_Manager(object):

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self,
                 scan_engine=None,
                 num_loop=None,
                 num_frame=None,
                 num_save_files=None,
                 adb_pull_dir=None,
                 frame_storage_dir=None):
        """ Constructor"""


        # Import Global Variables
        self._gv_scan_engine = gv().scan_engine_dict

        # Scan Engine App Variables
        self._scan_app = self._gv_scan_engine[scan_engine]['app']
        self._num_frame = num_frame
        self._num_save_files = num_save_files
        self._num_loop = num_loop

        # Directory Variables
        self._frame_storage_dir = frame_storage_dir
        self._pull_dir = '"{pull_dir}"'.format(pull_dir=adb_pull_dir)  # insert "" for adb purpose

    # ************************************************* #
    # **************** Public Methods ***************** #
    # ************************************************* #
    def run_scan_engine(self):
        """ Launch the scan engine app on the device """
        # Return value
        ret = False
        check_string = 'finished'

        # Concatenate the scan command
        scan_command = "{scan_app} -l {num_loop} -n {num_frame} -s {num_save_files}".\
            format(scan_app=self._scan_app,
                   num_loop=self._num_loop,
                   num_frame=self._num_frame,
                   num_save_files=self._num_save_files)

        # Run the scan command
        scan_engine_process = subprocess.Popen("adb shell", stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=True)
        scan_engine_stdout = scan_engine_process.communicate(scan_command.encode())[0].decode('ascii', errors='ignore')

        if (scan_engine_stdout.find(check_string) != -1):
            ret = True
        else:
            pass

        return ret

    def pull_images(self):
        """ Run the "adb pull" command to download all frames """
        # Return value
        ret = False
        check_string = 'pulled, 0 skipped'

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

    def clear_frame_storage_dir(self):
        """ Clear the frame storage folder on the device """

        # Delete command
        delete_cmd = "rm -v /{dir}/*".format(dir=self._frame_storage_dir)

        # Run the delete command
        delete_process = subprocess.Popen("adb shell", stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=True)
        delete_process_stdout = delete_process.communicate(delete_cmd.encode())[0].decode('ascii', errors='ignore')
        pass


    @property
    def pull_dir(self):
        return self._pull_dir

    @pull_dir.setter
    def pull_dir(self, pull_dir):
        self._pull_dir = pull_dir


if __name__ == "__main__":
    # Get Current working directory and set the pull directory
    current_dir = os.getcwd()
    adb_pull_dir = '{current_dir}/test/download/'.format(current_dir=current_dir)

    test = SX5_Manager(scan_engine='halogen1',
                       num_frame=10,
                       num_loop=3,
                       num_save_files=30,
                       frame_storage_dir='data/local/tmp',
                       adb_pull_dir=adb_pull_dir)
    test.run_scan_engine()
    test.pull_images()

    test.clear_frame_storage_dir()