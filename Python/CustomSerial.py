# Created by gcristini at 19/10/2018

import serial


class CustomSerial(serial.Serial):

    def __init__(self, **kwargs):
        """ Initialize (???) """
        super(CustomSerial, self).__init__(**kwargs)
        self._dataRX = ""
        self._bytes_available_rx = 0

    def serial_init(self):
        """ Open serial port, if closed """
        if self.is_open:
            self.close()
            self.open()
        else:
            None  # do nothing

    def serial_write(self, data):
        """ Use 'write' method of Serial class enconding data in UTF-8"""
        self.write(data.encode())

        return

    def serial_read(self):
        """ Use 'read' method of Serial class enconding data in UTF-8"""
        # TODO controllare codifica!
        self._dataRX = self.read(self._bytes_available_rx).decode('utf-8')
        #self._dataRX = self.readline()
        return self._dataRX

    @property
    def bytes_available_rx(self):
        """ Check available bytes of data """
        self._bytes_available_rx = self.inWaiting()
        return self._bytes_available_rx


if __name__ == '__main__':
    import time
    from datetime import datetime
    from Timer import Timer
    test_serial = CustomSerial(port="COM19", baudrate=115200)
    test_serial.serial_init()
    #test_serial.serial_write("init")
    #test_serial.serial_write('read_tempiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii')
    counter = 0

    tm=Timer()
    tm.start()

    while True:
        test_serial.serial_write('read_temp\r')

        while not test_serial.bytes_available_rx:

            pass

        x = test_serial.serial_read().strip("\r\n")
        print ((counter , tm.elapsed_time_s(2), x))
        counter = counter +1
        time.sleep(0.1)


