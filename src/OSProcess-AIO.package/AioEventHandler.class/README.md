AioEventHandler responds to external IO events, such as data available on a file descriptor. When an external IO event is received, an instance of AioEventHandler sends #changed to itself to notify its dependents that the event has occurred.