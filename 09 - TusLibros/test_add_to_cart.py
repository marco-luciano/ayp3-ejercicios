import unittest
from book_purchase import BookPurchase
from cart import Cart
from catalog import Catalog
from book_purchase_catalog import BookPurchaseCatalog
from add_to_cart import AddToCart
from customer import Customer
from create_cart import CreateCart

class TestAddToCart(unittest.TestCase):
    def setUp(self):
        self.customer_test = Customer('Foo', '123')
        self.customer_catalog = Catalog()
        self.customer_catalog.add(self.customer_test)
        self.create_cart = CreateCart(self.customer_test.uuid(), '123', self.customer_catalog)
        self.cart_catalog = Catalog()
        self.cart_catalog.add(self.create_cart.get_cart())

    def test00_product_added_succesfully(self):

        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 1, 40.00)
        product_catalog.add(product)

        add_to_cart = AddToCart(self.create_cart.get_description(), product.get_isbn(), product.get_quantity(), self.cart_catalog, product_catalog)

        self.assertEqual(add_to_cart.get_code(), 0)

    def test01_cannot_add_product_twice(self):

        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 1, 40.00)
        product_catalog.add(product)

        add_to_cart = AddToCart(self.create_cart.get_description(), product.get_isbn(), product.get_quantity(), self.cart_catalog, product_catalog)
        add_to_cart = AddToCart(self.create_cart.get_description(), product.get_isbn(), product.get_quantity(), self.cart_catalog, product_catalog)

        self.assertEqual(add_to_cart.get_code(), 1)
        self.assertEqual(add_to_cart.get_description(), 'Duplicate ISBN')

    def test02_cart_not_found_in_catalog(self):

        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 1, 40.00)
        product_catalog.add(product)

         # se vacia el catalogo para el test
        self.cart_catalog = Catalog()

        add_to_cart = AddToCart(self.create_cart.get_description(), product.get_isbn(), product.get_quantity(), self.cart_catalog, product_catalog)
        
        self.assertEqual(add_to_cart.get_code(), 1)
        self.assertEqual(add_to_cart.get_description(), 'Cart not found')
    
    def test03_product_not_found_in_catalog(self):
        product_catalog = BookPurchaseCatalog()
        product = BookPurchase('1234567890123', 1, 40.00)

        add_to_cart = AddToCart(self.create_cart.get_description(), product.get_isbn(), product.get_quantity(), self.cart_catalog, product_catalog)

        self.assertEqual(add_to_cart.get_code(), 1)
        self.assertEqual(add_to_cart.get_description(), 'Product not found')

if __name__ == '__main__':
    unittest.main()