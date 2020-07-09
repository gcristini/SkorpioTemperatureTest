from threading import Thread
import time

def dummy_runnable():
    pass


class CustomThread(Thread):
    def __init__(self,
                 thread_name="",
                 runnable=dummy_runnable,
                 num_of_iter=1,
                 #start_delay_ms=0,
                 timing_ms=0,
                 #print_current_iter=False
                 ):

        super().__init__()

        self._thread_name = thread_name
        self._runnable = runnable
        self._num_of_iter = num_of_iter
        #self._start_delay_ms = start_delay_ms
        self._timing_ms = timing_ms
        #self._print_current_iter = print_current_iter

        self._thread_status = False  # If False exit from thread

        return

    def run(self):
        """ Overriding run method of class Thread """
        # Thread can be executed
        self._thread_status = True

        if self._num_of_iter == "inf":
            while self._thread_status:
                self._runnable()
                time.sleep(self._timing_ms/1000)

        else:
            for iter in range(self._num_of_iter):
                if self._thread_status:
                    self._runnable()
                    time.sleep(self._timing_ms/1000)
                else:
                    print("Exit from thread")
                    break
        return

    def stop(self):
        self._thread_status = False


if __name__ == '__main__':
    def runnable_1():
        print("Thread 1")
        #time.sleep(2)

    def runnable_2():
        print ("Thread 2")
        #time.sleep(1)

    thread1 = CustomThread(runnable=runnable_1,
                           num_of_iter="inf",
                           timing_ms=2000)
    thread1.start()

    thread2 = CustomThread(runnable=runnable_2,
                           num_of_iter=5,
                           timing_ms=1000)

    thread2.start()

    thread2.join()
    thread1.stop()

    thread1.join()



    print("\n\n FINISHED!")


