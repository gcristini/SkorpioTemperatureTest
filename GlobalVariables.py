class GlobalSettings(object):
    def __init__(self):
        self.__global_settings = {
            'debug': True
        }

    @property
    def global_settings(self):
        return self.__global_settings


class GlobalVariables(object):
    def __init__(self):
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





if __name__ == "__main__":

    test = GlobalVariables().scan_engine_dict

    print(test)