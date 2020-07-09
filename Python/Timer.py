# timer.py

import time


class TimerError(Exception):
    """A custom exception used to report errors in use of Timer class"""
pass


class TimeUtils(object):
    """TODO"""
pass

class TimerStatusEnum:
    TS_START = "start"
    TS_STOP = "stop"


class Timer(object):
    def __init__(self):
        self._start_time = None
        self._timer_status = None
        self._elapsed_time_s = None

    def start(self):
        """Start a new timer"""
        if self._start_time is not None:
            raise TimerError(f"Timer is running. Use .stop() to stop it")

        self._elapsed_time_s = 0
        self._timer_status = TimerStatusEnum.TS_START

        self._start_time = time.perf_counter()

    def stop(self):
        """Stop the timer, and report the elapsed time"""
        if self._start_time is None:
            raise TimerError(f"Timer is not running. Use .start() to start it")

        self._timer_status = TimerStatusEnum.TS_STOP
        self._elapsed_time_s = time.perf_counter() - self._start_time
        self._start_time = None

        pass


    def reset(self):
        if self._start_time is None:
            raise TimerError(f"Timer is not running. Use .start() to start it")
        self._timer_status = TimerStatusEnum.TS_START
        self._start_time = time.perf_counter()

    def elapsed_time_hour(self, digits=None):
        """"""
        if digits:
            elapsed_time_hour = round(self.elapsed_time_min()/60, digits)
        else:
            elapsed_time_hour = self.elapsed_time_min()/ 60
        return elapsed_time_hour

    def elapsed_time_min(self, digits=None):
        """"""
        if digits:
            elapsed_time_min = round(self.elapsed_time_s()/60, digits)
        else:
            elapsed_time_min = self.elapsed_time_s()/60
        return elapsed_time_min

    def elapsed_time_s(self, digits=None):
        """"""
        if self._timer_status == TimerStatusEnum.TS_START:
            self._elapsed_time_s = time.perf_counter() - self._start_time
        else:
            pass

        if digits:
            elapsed_time_s = round(self._elapsed_time_s, digits)
        else:
            elapsed_time_s = self._elapsed_time_s
        return elapsed_time_s

    def elapsed_time_ms(self, digits=None):
        """"""
        if digits:
            elapsed_time_ms = round((self.elapsed_time_s())*1000, digits)
        else:
            elapsed_time_ms = (self.elapsed_time_s())*1000
        return elapsed_time_ms

    def elapsed_time_us(self, digits=None):
        """"""
        if digits:
            elapsed_time_us = round(self.elapsed_time_ms()*1000, digits)
        else:
            elapsed_time_us = self.elapsed_time_ms()*1000
        return elapsed_time_us

    def timer_status(self, digits=None):
        return self._timer_status


if __name__ == '__main__':
    # Init and start timer
    test_timer = Timer()
    test_timer.start()

    # Pause 2 seconds
    time.sleep(2)
    print("1) Timer elapsed: {time}".format(time=test_timer.elapsed_time_ms()))

    print("--- Reset Timer...")

    #Reset timer and wait 5 second
    test_timer.reset()
    time.sleep(2)

    print("2) Timer elapsed: {time}".format(time=test_timer.elapsed_time_min(2)))

    test_timer.stop()
    time.sleep (1)
    print (test_timer.elapsed_time_s(2))
    print("3) Timer elapsed: {time}".format(time=test_timer.elapsed_time_s(digits=2)))


    print ("Finished")

