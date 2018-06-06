class BaseSet(object):
    def __init__(self):
        self.code = 1000
        
    @property
    def dict(self):
        return self.__dict__