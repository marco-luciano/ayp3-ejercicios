import unittest
from cart import Cart
from checkout import Checkout
from book_purchase import BookPurchase
from order import Order

class TestCheckout(unittest.TestCase):
    def test01_cannot_checkout_an_empty_cart(self):
        cart_test = Cart()
        credit_card = []
        checkout_test = Checkout(cart_test, credit_card)

        self.assertEqual('rejected', checkout_test.status)
        self.assertEqual('Cannot checkout an empty cart', checkout_test.description)

    def test02_credit_card_ccn_length_error(self):
        pass

    def test03_credit_card_cced_error(self):
        pass

    def test04_checkout_credit_card_successful(self):
        cart_test = Cart()
        item_test = BookPurchase('1234567890123', 2)
        cart_test.add_item(item_test)

        credit_card = {
        'ccn' : '450799000000004905',
        'cco' : 'john doe',
        'cced' : '202109',
        }

        checkout_test = Checkout(cart_test, credit_card)

        self.assertEqual('approved', checkout_test.status)
        self.assertEqual('', checkout_test.description)

if __name__ == '__main__':
    unittest.main()