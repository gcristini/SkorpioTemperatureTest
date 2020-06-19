#!/usr/bin/env python

import sys
import os
from Parser import Parser
from SX5_Manager import SX5_Manager
from ParseXml import XmlDictConfig
from xml.etree import ElementTree
from ImageManager import ImageManager
from GlobalVariables import GlobalVariables as gv



class TemperatureTestSx5(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        self._config_file = 'Config.xml'
        self._config_dict = None
        self._SX5 = None
        self._image_manager = None
        self._gv_scan_engine = gv().scan_engine_dict

        pass

    def parse_config_file(self):
        """ """
        # Read Configuration file and store it into dictionary
        self._config_dict = XmlDictConfig(ElementTree.parse(self._config_file).getroot())

        pass

    def init_sx5(self):
        """ """


        #print (self._config_dict['SX5']['adb_pull_base_dir'])

        # Init an SX5 instance
        self._SX5 = SX5_Manager(scan_engine=self._config_dict['SX5']['scan_engine'],
                                num_frame=self._config_dict['SX5']['num_of_frame'],
                                num_loop=self._config_dict['SX5']['num_of_loop'],
                                num_save_files=self._config_dict['SX5']['num_of_save_files'],
                                frame_storage_dir=self._config_dict['SX5']['frame_storage_dir'],
                                adb_pull_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                )
        pass

    def init_thermal_chamber(self):
        pass

    def init_image_manager(self):

        self._image_manager = ImageManager(input_dir=self._config_dict['SX5']['adb_pull_base_dir'],
                                           output_dir=self._config_dict['ImageManager']['output_dir'],
                                           img_width=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']]['width'],
                                           img_height=self._gv_scan_engine[self._config_dict['SX5']['scan_engine']]['height'],
                                           out_ext=self._config_dict['ImageManager']['img_format'])

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
        # Init Image Manager
        self.init_image_manager()

        # ----------------- RUN ----------------- #
        self._SX5.run_scan_engine()
        self._SX5.pull_images()

        self._image_manager.convert_images(show=False, save=True)

        self._SX5.clear_frame_storage_dir()



TemperatureTestSx5().main()

