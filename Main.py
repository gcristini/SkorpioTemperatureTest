#!/usr/bin/env python

import sys
import os
from Parser import Parser
from TemperatureTestSX5 import TemperatureTestSx5
from Debug import Debug as dbg
from GlobalVariables import GlobalSettings as gs

class Main(object):
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

        self._TemperatureTestSX5 = TemperatureTestSx5()

        self._gs = gs().global_settings

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
        dbg.debug(print, "Start Main", debug=self._gs['debug'])
        self._TemperatureTestSX5.run_test()


Main().main()

