from merchant_processor import MerchantProcessor
from order import Order

class Checkout:
    def __init__(self, cart, credit_card):
        self.status = 'rejected'
        self.description = 'Cannot checkout an empty cart'
        self.external_reference_id = ''
        self._cart = cart
        self._credit_card = credit_card
        # Se crea el pedido independientemente del resultado del pago 
        self._order = Order()
        self.execute_payment()

        #

    
    def execute_payment(self):
        # TODO: validaciones, llamado al mockup MerchantProcessor
        if 'ccn' in self._credit_card:
            if(self._credit_card["ccn"] == '450799000000004905'):   #mock
                self.status = 'approved'
                self.description = ''
            
