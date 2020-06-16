import sys


class Help(object):
    """ """
    def __init__(self):
        pass

    def error_message(self, error):
        # Print error message
        self._print_error_message(error)

        # Print Help
        res = input(" Print help? (Y/N): ")
        if res.upper() == 'Y':
            # Print help
            self.print_help()
        else:
            sys.exit()

    def warning_message(self, warning):
        self._print_warning_message(warning)

    @staticmethod
    def _print_error_message(error):
        print('\n-ERROR: ' + error)

    @staticmethod
    def _print_warning_message(warning):
        print('\n-WARNING: ' + warning)

    @staticmethod
    def print_help():
    #     print('\n' + '*'*46)
    #     print('****'*3 + ' '*9 + 'HELP' + ' '*9 + '****'*3)
    #     print('*' * 46)
    #
    #     # NAME
    #     print("NAME: ")
    #     print('\t' + sys.argv[0] + " - Resize images to reduce filesize to a specified value")
    #
    #     # SYNOPSIS
    #     print("\nSYNOPSIS: ")
    #     print('\t' + sys.argv[0] + ' '
    #           '[-id <input directory>] ' +
    #           '[-od <output directory>] ' +
    #           '[-if <input files>] ' +
    #           '[-w <filesize>] ' +
    #           '[-s <include subdirectories>]'
    #           '[-h <help>] ')
    #
    #     # DESCRIPTION
    #     print("\nDESCRIPTION: ")
    #     print("\tdescription")
    #
    #     # OPTIONS
    #     print("\nOPTIONS: ")
    #     print("\t-id \tinput directory:")
    #     print("\t\t\t Specify the directory in which search for images. DEFAULT: <current directory>")
    #
    #     print("\t-od \toutput directory:")
    #     print("\t\t\t Specify the directory in which save resized images. DEFAULT: <current directory\out>")
    #
    #     print("\t-if \tinput files:")
    #     print("\t\t\t Specify name of the files to resize. If \'-if all \' resize all files into directory. "
    #           "DEFAULT: all")
    #
    #     print("\t-w \tfile size:")
    #     print("\t\t\t Specify the file size in MB of the resized images. DEFAULT: 1")
    #
    #     print("\t-s \tfile size:")
    #     print("\t\t\t Include subfolders into search. DEFAULT: False")
    #
    #     print("\t-h \tprint help:")
    #     print("\t\t\t Print Help")

        # Exit from script
        sys.exit()
