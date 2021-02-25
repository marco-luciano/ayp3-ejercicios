import unittest
from book_purchase import BookPurchase
from cart import Cart
from catalog import Catalog
from book_purchase_catalog import BookPurchaseCatalog
from add_to_cart import AddToCart
from customer import Customer
from create_cart import CreateCart
from list_cart import ListCart

class TestListCart(unittest.TestCase):
    def setUp(self):
        self.customer_test = Customer('Foo', '123')
        self.customer_catalog = Catalog()
        self.customer_catalog.add(self.customer_test)
        self.create_cart = CreateCart(self.customer_test.uuid(), '123', self.customer_catalog)
        self.cart_catalog = Catalog()
        self.cart_catalog.add(self.create_cart.get_cart())
        self.cart_id = self.create_cart.get_description()

    def test00_cart_list_empty_successful(self):
        list_cart = ListCart(self.cart_id, self.cart_catalog)

        self.assertEqual(list_cart.code,0)
        self.assertEqual(len(list_cart.get_description()),0)

    def test01_cart_list_many_items_successful(self):
        # simulacion de catalogo
        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 707, 40.00)
        product_catalog.add(product)

        add_to_cart = AddToCart(self.create_cart.get_description(), '1234567890123', 707, self.cart_catalog, product_catalog)
        list_cart = ListCart(self.cart_id, self.cart_catalog)

        self.assertEqual(list_cart.code,0)
        self.assertEqual(list_cart.get_description()[0]['quantity'],707)

    def test02_cart_not_found(self):
        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 5, 40.00)
        product_catalog.add(product)

        add_to_cart = AddToCart('fake uuid', '1234567890123', 707, self.cart_catalog, product_catalog)
        list_cart = ListCart(self.cart_id, self.cart_catalog)

        self.assertEqual(add_to_cart.get_code(), 1)
        self.assertEqual(add_to_cart.get_description(), 'Cart not found')
if __name__ == '__main__':
    unittest.main()