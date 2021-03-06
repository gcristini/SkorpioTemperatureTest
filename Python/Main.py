#!/usr/bin/env python

import sys
import os
from Parser import Parser
from TemperatureTestSX5_TC import TemperatureTestSx5_TC
from TemperatureTestSX5_TS import TemperatureTestSx5_TS
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

        #self._TemperatureTestSX5_TC = TemperatureTestSx5_TC()
        self._TemperatureTestSX5_TS = TemperatureTestSx5_TS()

        self._init_state_manager_gs = gs().global_settings

        self._main_state = enum.MainAppStatesEnum.MAS_INIT
        self._last_main_state = enum.MainAppStatesEnum.MAS_INIT

    # ---------------------------------------------------------------- #
    # ----------------------- Private Methods ------------------------ #
    # ---------------------------------------------------------------- #
    @staticmethod
    def _print_help():
        """"""
        print(cm.Fore.YELLOW + cm.Style.DIM + "\n----------------------------")
        print(cm.Fore.YELLOW + cm.Style.DIM + "--- Show Usage ---")
        print(cm.Fore.YELLOW + cm.Style.DIM + "-run: run test")
        print(cm.Fore.YELLOW + cm.Style.DIM + "-exit: exit from script")
        print(cm.Fore.YELLOW + cm.Style.DIM + "-help: this help")
        print(cm.Fore.YELLOW + cm.Style.DIM + "----------------------------\n")
    pass

    # ******** State Machine Functions ******** #
    def _init_state_manager(self):
        """"""
        # Initialize Colorama
        cm.init(autoreset=True)

        print(cm.Fore.MAGENTA + "---------- WELCOME TO TEMPERATURE TEST SX5! ---------- ")

        # Go to Wait State
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT
        pass

    def _wait_state_manager(self):
        """"""
        cmd = input("- Please enter a command: ")

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
        print(cm.Fore.GREEN + cm.Style.DIM + "\n---------- Run Test ----------")
        #self._TemperatureTestSX5_TC.run_test()
        self._TemperatureTestSX5_TS.run_test()

        # Go to Wait state
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT

        pass

    def _help_state_manager(self):
        """"""
        # Print Help
        self._print_help()

        # Go to wait state
        self._main_state = enum.MainAppStatesEnum.MAS_WAIT
        pass

    def _exit_state_manager(self):
        """"""
        print(cm.Fore.MAGENTA + "Goodbye!")
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

