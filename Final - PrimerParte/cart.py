from expiration_timer import ExpirationTimer

class Cart:
    def __init__(self):
        self._timer = ExpirationTimer(30)
        self._products = []

    def add_item(self, item):
        self._products.append(item)
        self._timer.reset_time()

    def get_products(self):
        if self._timer.has_expired():
            self._products = []
        
        self._timer.reset_time()
        return self._products
    
    def number_of_products(self):
        return len(self.get_products())