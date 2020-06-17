import os
import subprocess


class SX5_Manager(object):
    scan_engine_dict = {
        'halogen': 'halogen_cli2',
        'neon1': 'neon_mipi_cli2',
        'neon2': 'neon_mipi_cli2'
    }

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

        # Scan Engine Variables
        self._scan_engine = self.scan_engine_dict[scan_engine]
        self._num_frame = num_frame
        self._num_save_files = num_save_files
        self._num_loop = num_loop

        # Directory Variables
        self._frame_storage_dir = frame_storage_dir
        self._pull_dir = adb_pull_dir

    # ************************************************* #
    # **************** Public Methods ***************** #
    # ************************************************* #
    def run_scan_engine(self):
        """ """
        # Return value
        ret = False
        check_string = 'finished'

        # Concatenate the scan command
        scan_command = "{scan_engine} -l {num_loop} -n {num_frame} -s {num_save_files}".\
            format(scan_engine=self._scan_engine, \
                   num_loop=self._num_loop,\
                   num_frame=self._num_frame,\
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

    @property
    def pull_dir(self):
        return self._pull_dir

    @pull_dir.setter
    def pull_dir(self, pull_dir):
        self._pull_dir = pull_dir


if __name__ == "__main__":
    # Get Current working directory and set the pull directory
    current_dir = os.getcwd()
    adb_pull_dir= '\"{current_dir}/test_download\"'.format(current_dir=current_dir)
    #print(pull_dir)

    test = SX5_Manager(scan_engine='halogen',
                       num_frame=10,
                       num_loop=2,
                       num_save_files=2,
                       frame_storage_dir='data/local/tmp',
                       adb_pull_dir=adb_pull_dir)
    test.run_scan_engine()
    test.pull_images()
