#!/usr/bin/env python

import sys
import os
from Parser import Parser
from SX5_Manager import SX5_Manager
from ParseXml import XmlDictConfig
from xml.etree import ElementTree



class TemperatureTestSx5(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        self._config_file = 'Config.xml'
        self._config_dict = None
        self._SX5 = None
        pass

    def parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._config_file).getroot())
        pass

    def init_sx5(self):
        """ """
        # Get SX5 dictionary from config file and update the "adb_pull_dir" field
        sx5_config_dict = self._config_dict['SX5']
        sx5_config_dict['adb_pull_base_dir'] = '\"{cwd}/{dir}\"'.format(cwd=os.getcwd(),
                                                                        dir=sx5_config_dict['adb_pull_base_dir'])
        print (sx5_config_dict['adb_pull_base_dir'])

        # Init an SX5 instance
        self._SX5 = SX5_Manager(scan_engine=sx5_config_dict['scan_engine'],
                                num_frame=sx5_config_dict['num_of_frame'],
                                num_loop=sx5_config_dict['num_of_loop'],
                                num_save_files=sx5_config_dict['num_of_save_files'],
                                frame_storage_dir=sx5_config_dict['frame_storage_dir'],
                                adb_pull_dir=sx5_config_dict['adb_pull_base_dir'],)
        pass

    def init_thermal_chamber(self):
        pass


    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def main(self):
        """ """
        # ----------------- INIT ----------------- #
        # Parse input arguments
        #self._parser.parse_input_args()

        # Parse config file
        self.parse_config_file()
        # Set SX5
        self.init_sx5()

        # ----------------- RUN ----------------- #
        self._SX5.run_scan_engine()
        self._SX5.pull_images()

        #self._SX5.clear_frame_storage_dir()



TemperatureTestSx5().main()

