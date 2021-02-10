from expiration_timer import ExpirationTimer

class Cart:
    def __init__(self):
        self._timer = ExpirationTimer(30)
        self._internal_list_of_items = []

    def add_item(self, item):
        self._internal_list_of_items.append(item)
        self._timer.reset_time()

    def get_items(self):
        if self._timer.has_expired():
            self._internal_list_of_items = []
        
        self._timer.reset_time()
        return self._internal_list_of_items