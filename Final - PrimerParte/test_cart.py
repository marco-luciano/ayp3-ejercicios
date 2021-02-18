import unittest
from datetime import datetime, timedelta

from cart import Cart
from book_purchase import BookPurchase
from merchant_processor_mock import MerchantProcessorMock
from credit_card_validator import CreditCardValidator

class TestCart(unittest.TestCase):
    def test00_cart_should_start_empty(self):
        testing_cart = Cart()

        self.assertEqual(0, testing_cart.number_of_products())
    
    def test01_add_item_to_cart(self):
        testing_book = BookPurchase('1234567891234', 1, 10)
        testing_cart = Cart()

        testing_cart.add_item(testing_book)

        self.assertEqual(1, len(testing_cart.get_products()))
    
    def test02_add_multiple_items_to_cart(self):
        first_testing_book = BookPurchase('1234567891234', 1, 10)
        second_testing_book = BookPurchase('1234567894321', 3, 10)
        testing_cart = Cart()

        testing_cart.add_item(first_testing_book)
        testing_cart.add_item(second_testing_book)

        self.assertEqual(2, testing_cart.number_of_products())
    
    def test03_cart_should_return_correct_total_price(self):
        first_testing_book = BookPurchase('1234567891234', 1, 10)
        second_testing_book = BookPurchase('1234567894321', 3, 40)

        testing_cart = Cart()

        testing_cart.add_item(first_testing_book)
        testing_cart.add_item(second_testing_book)

        self.assertEqual(130, testing_cart.get_total_price())
    
    def test04_cart_should_be_empty_after_30_minutes(self):
        testing_book = BookPurchase('1234567891234', 1, 10)
        testing_cart = Cart()

        testing_cart.add_item(testing_book)
        self.assertEqual(1, testing_cart.number_of_products())

        testing_cart._timer._last_updated_time = datetime.now() - timedelta(minutes = 30)
        self.assertEqual(0, testing_cart.number_of_products())
    
    def test05_cart_timer_should_update_after_action(self):
        testing_cart = Cart()

        testing_cart._timer._last_updated_time = datetime.now() - timedelta(minutes = 30)
        testing_cart.get_products()

        self.assertEqual(testing_cart._timer._last_updated_time.minute, datetime.now().minute)
    
    def test06_cart_checkout_without_any_problems(self):
        testing_cart = Cart()
        testing_book = BookPurchase('1234567891234', 1, 10)

        testing_cart.add_item(testing_book)

        testing_credit_card_number = "123435"
        testing_credit_card_expiration = "092025"
        testing_credit_card_owner = "Persona Falsa"
        testing_merchant_handler = MerchantProcessorMock(CreditCardValidator())

        response = testing_cart.checkout_cart(
            testing_credit_card_number, testing_credit_card_expiration, 
            testing_credit_card_owner, testing_merchant_handler
        )

        self.assertEqual(True, response['status'])
        self.assertEqual('ID', response['msg'])
    
    def test07_cart_checkout_with_problem(self):
        testing_cart = Cart()
        testing_book = BookPurchase('1234567891234', 1, 10)

        testing_cart.add_item(testing_book)

        testing_credit_card_number = "123435"
        invalid_credit_card_expiration = "092020"
        testing_credit_card_owner = "Persona Falsa"
        testing_merchant_handler = MerchantProcessorMock(CreditCardValidator())

        response = testing_cart.checkout_cart(
            testing_credit_card_number, invalid_credit_card_expiration, 
            testing_credit_card_owner, testing_merchant_handler
        )

        self.assertEqual(False, response['status'])
        self.assertEqual('Invalid credit card expiration date.', response['msg'])



if __name__ == '__main__':
    unittest.main()