#!/usr/bin/env python

import sys
import os
from Parser import Parser
from SX5_Manager import SX5_Manager


class TemperatureTestSx5(object):
    """ """


    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        """ Constructor """

        # Dictionary for input line command.
        self._parse_dict = {
            '-a': self._parse_fun_a,
            '-b': self._parse_fun_b,
        }

        # Initialize Parser with input arguments and parser dictionary
        self._parser = Parser(input_args=sys.argv[1:],
                              parse_dict=self._parse_dict)

    # ******** Parser Dictionary Functions ******** #
    def _parse_fun_a(self, argv):
        """ Parser function [-id]: set input directory of ImageManager """
        if argv:
            pass
        else:
            pass

    def _parse_fun_b(self, argv):
        """ Parser function [-id]: set input directory of ImageManager """
        if argv:
            pass
        else:
            pass

    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def main(self):
        """ """
        # Parse input arguments
        #self._parser.parse_input_args()

        # Run applicativo
        # for i in range (1,10):
        #     SX5_Manager().run_scan_engine()
        # pass

""" """

TemperatureTestSx5().main()

