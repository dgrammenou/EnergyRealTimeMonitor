import threading
import requests

sec = 86400 # seconds of a day
def func(): 
    requests.get("http://paparrigopoulos.com:4020/api/updateSubscriptions")
    
def set_interval(func, sec):
    def func_wrapper():
        set_interval(func, sec)
        func()
    t = threading.Timer(sec, func_wrapper)
    t.start()
    return t

set_interval(func, sec)