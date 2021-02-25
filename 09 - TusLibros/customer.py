import uuid

class Customer:
    def __init__(self, user, password):
        self._user = user
        self._password = password
        self._uuid = str(uuid.uuid4())
    
    def user(self):
        return self._user

    def uuid(self):
        return self._uuid
    
    def check_password(self, password):
        return self._password == password