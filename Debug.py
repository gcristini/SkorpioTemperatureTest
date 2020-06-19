class Debug (object):
    def __init__(self):
        pass

    @staticmethod
    def debug(function, *args, debug):
        if debug == True:
            function(*args)

        pass


if __name__ == '__main__':
    from Debug import Debug as db

    flag = True

    db.debug(print, "Print if true", debug=flag)

    db.debug(print, "Don't print if false", debug= not flag)




