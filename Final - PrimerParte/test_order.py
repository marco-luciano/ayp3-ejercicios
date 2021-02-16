import unittest
from cart import Cart
from order import Order

class TestOrder(unittest.TestCase):
    
    def test01_cannot_create_order_with_empty_cart:
        test_cart = Cart()

        test_order = Order(test_cart)



if __name__ == '__main__':
    unittest.main()