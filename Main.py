#!/usr/bin/env python

import sys
import os
from Parser import Parser
from TemperatureTestSX5 import TemperatureTestSx5
from Debug import Debug as dbg
from GlobalVariables import GlobalSettings as gs
from GlobalVariables import Enumerations as enum
import colorama as cm

class Main(object):
    """ """

    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self):
        """ Constructor """

        # Dictionary for input line command.
        self._main_state_fun_dict = {
            enum.MainAppStatesEnum.MAS_INIT: self._init_state_manager,
            enum.MainAppStatesEnum.MAS_WAIT: self._wait_state_manager,
            enum.MainAppStatesEnum.MAS_RUN: self._run_state_manager,
            enum.MainAppStatesEnum.MAS_HELP: self._help_state_manager,
            enum.MainAppStatesEnum.MAS_EXIT: self._exit_state_manager
        }

        self._TemperatureTestSX5 = TemperatureTestSx5()

        self._init_state_manager_gs = gs().global_settings

        self._main_state = enum.MainAppStatesEnum.MAS_INIT
        self._last_main_state = enum.MainAppStatesEnum.MAS_INIT

    # ******** State Machine Functions ******** #
    def _init_state_manager(self):
        """"""
        # Initialize Colorama
        cm.init(autoreset=True)

        print(cm.Fore.GREEN + " ---------- WELCOME! ---------- ")

        # Go to Wait State
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT
        pass

    def _wait_state_manager(self):
        """"""

        cmd = input("Please enter a command: ")
        print('\n')

        if cmd == enum.MainAppCommands.MAC_RUN:
            # Go to run state
            self._main_state = enum.MainAppStatesEnum.MAS_RUN

        elif cmd == enum.MainAppCommands.MAC_HELP:
            # Go to wait state
            self._main_state = enum.MainAppStatesEnum.MAS_HELP

        elif cmd == enum.MainAppCommands.MAC_EXIT:
            # Go to exit state
            self._main_state = enum.MainAppStatesEnum.MAS_EXIT

        else:
            # Go to help state
            self._main_state = enum.MainAppStatesEnum.MAS_HELP
        pass

    def _run_state_manager(self):
        """"""
        print(cm.Fore.CYAN + cm.Style.DIM + "Run Test\n")
        self._TemperatureTestSX5.run_test()

        # Go to Wait state
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT

        pass

    def _help_state_manager(self):
        """"""
        print("HELP USAGE\n\n")

        # Go to wait state
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT
        pass

    def _exit_state_manager(self):
        """"""
        print (cm.Fore.LIGHTGREEN_EX + "Exiting...")
        sys.exit()
        pass

    def _main_state_machine_manager(self):
        """"""
        # Get function from dictionary
        fun = self._main_state_fun_dict.get(self._main_state)
        # Execute function
        fun()

        pass

    # ************************************************ #
    # **************** Public Methods **************** #
    # ************************************************ #
    def main(self):
        """ Main Application """

        # Init
        self._init_state_manager()

        while not (self._main_state == enum.MainAppStatesEnum.MAS_EXIT and
                   self._last_main_state == enum.MainAppStatesEnum.MAS_EXIT):

            # Store the last state machine state
            self._last_main_state = self._main_state

            # Run state machine at current state
            self._main_state_machine_manager()


Main().main()