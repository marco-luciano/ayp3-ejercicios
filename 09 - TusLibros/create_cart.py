import unittest
from datetime import datetime, timedelta

from cart import Cart
from book_purchase import BookPurchase
from merchant_processor_mock import MerchantProcessorMock
from credit_card_validator import CreditCardValidator
from expiration_timer import ExpirationTimer
from catalog import Catalog

class CreateCart:
    def __init__(self, customer_id, password, customer_catalog):
        if customer_id in customer_catalog.key_list():
            self._cart = Cart(customer_id)
            self._customer = customer_catalog.get(customer_id)
            self.code = 0
            self.description = self._cart.uuid()

            if self._customer.check_password(password) is False:
                self.code = 1
                self.description = 'PASS_INCORRECT'  
        else:
            self.code = 1
            self.description = 'CUSTOMER_NOT_FOUND'
    
    def response(self):
        return self.code + '|' + self.description