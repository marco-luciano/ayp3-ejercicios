import unittest
from cart import Cart
from create_cart import CreateCart
from customer import Customer
from book_purchase import BookPurchase
from merchant_processor_mock import MerchantProcessorMock
from credit_card_validator import CreditCardValidator
from expiration_timer import ExpirationTimer
from catalog import Catalog

class TestCreateCart(unittest.TestCase):
    
    def test00_valid_cart(self):
        customer_test = Customer('Foo', '123')
        customer_catalog = Catalog()
        customer_catalog.add(customer_test)
        create_cart = CreateCart(customer_test.uuid(), '123', customer_catalog)

        self.assertEqual(create_cart.get_code(), 0)

    def test01_invalid_credentials(self):
        customer_test = Customer('Foo', '123')
        customer_catalog = Catalog()
        customer_catalog.add(customer_test)
        create_cart = CreateCart(customer_test.uuid(), '124', customer_catalog)

        self.assertEqual(create_cart.get_code(), 1)
        self.assertEqual(create_cart.get_description(), 'PASS_INCORRECT')

    def test02_customer_not_found(self):
        customer_test = Customer('Foo', '123')
        customer_catalog = Catalog()

        create_cart = CreateCart(customer_test.uuid(), '123', customer_catalog)

        self.assertEqual(create_cart.get_code(), 1)
        self.assertEqual(create_cart.get_description(), 'CUSTOMER_NOT_FOUND')

if __name__ == '__main__':
    unittest.main()