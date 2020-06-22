class GlobalSettings(object):
    def __init__(self):
        self.__global_settings = {
            'debug': False,
            'Config File': 'Config.xml'
        }

    @property
    def global_settings(self):
        return self.__global_settings


class GlobalVariables(object):
    def __init__(self):
        # Scan Engine Parameters
        self.__scan_engine_dict = {
            'halogen1': {
                'app': 'halogen_cli2',
                'width': 752,
                'height': 480,
            },
            'halogen2': {
                'app': 'halogen_cli2',
                'width': 1408,
                'height': 960,
            },
            'neon1': {
                'app': 'neon_mipi_cli2',
                'width': 1408,
                'height': 964,
            },
            'neon2': {
                'app': 'neon_mipi_cli2',
                'width': 1408,
                'height': 804,
            },
            'tungsten': {
                'app': 'tungsten_cli2',
            },
        }


    @property
    def scan_engine_dict(self):
        return self.__scan_engine_dict


class Enumerations:
    """ Enumerations """
    class TempTestStatesEnum:
        """ Status of Temperature Test machine (TemperatureTestSX5.py) """
        TT_INIT = "Init"
        TT_RUN_SCAN_ENGINE_APP = "RunScanEngineApp"
        TT_PULL_IMAGES = "PullImages"
        TT_ERROR = "Error"
        TT_STOP = "Stop"
        TT_MAX_ENUM = ""

    class MainAppStatesEnum:
        """ Status of Main Applicative (Main.py)"""
        MAS_INIT = "Init"
        MAS_WAIT = "Wait"
        MAS_RUN = "Run"
        MAS_HELP = "Help"
        MAS_EXIT = "Exit"
        MAS_MAX_ENUM = ""

    class MainAppCommands:
        """ Commands of Main Applicative State Machine (Main.py)"""
        MAC_RUN = "run"
        MAC_STOP = "stop"
        MAC_HELP = "wait"
        MAC_EXIT = "exit"


if __name__ == "__main__":

    test = GlobalVariables().scan_engine_dict

    print(test)