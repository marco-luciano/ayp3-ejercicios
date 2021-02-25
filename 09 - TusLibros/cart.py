import uuid
from expiration_timer import ExpirationTimer

class Cart:
    def __init__(self, customer_id = ''):
        self._timer = ExpirationTimer(30)
        self._products = []
        self._customer_id = customer_id
        self._uuid = str(uuid.uuid4())

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
    
    def get_total_price(self):
        total_price = 0
        
        for product in self._products:
            total_price += product.get_total_price()
        
        return total_price
    
    def checkout_cart(self, credit_card_number, credit_card_expiration, credit_card_owner,
                      merchant_processor_handler):
        return merchant_processor_handler.process_checkout(
            credit_card_number, 
            credit_card_expiration,
            credit_card_owner,
            "%0.2f" % self.get_total_price())
    
    def uuid(self):
        return self._uuid