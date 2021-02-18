import unittest
from book_purchase import BookPurchase

class TestBookPurchase(unittest.TestCase):
    def test00_book_saves_correctly_the_isbn_and_quantity(self):
        testing_isbn = '1234567891234'
        testing_quantity = 1
        testing_price = 25

        testing_book_purchase = BookPurchase(testing_isbn, testing_quantity, testing_price)

        self.assertEqual(testing_isbn, testing_book_purchase.get_isbn())
        self.assertEqual(testing_quantity, testing_book_purchase.get_quantity())
    
    def test01_get_total_price_of_the_book_purchase(self):
        testing_isbn = '1234567891234'
        testing_quantity = 3
        testing_price = 25

        testing_book_purchase = BookPurchase(testing_isbn, testing_quantity, testing_price)

        self.assertEqual(75, testing_book_purchase.get_total_price())
    
    def test02_invalid_isbn_should_raise_error(self):
        ilegal_isbn = '1'
        testing_quantity = 1
        testing_price = 25

        with self.assertRaises(ValueError) as error:
            testing_book_purchase = BookPurchase(ilegal_isbn, testing_quantity, testing_price)
        
        self.assertEqual('Illegal ISBN', str(error.exception))
    
    def test03_invalid_quantity_should_raise_error(self):
        testing_isbn = '1234567891234'
        ilegal_quantity = 0
        testing_price = 25

        with self.assertRaises(ValueError) as error:
            testing_book_purchase = BookPurchase(testing_isbn, ilegal_quantity, testing_price)
        
        self.assertEqual('Quantity must be greater or equal to 1', str(error.exception))
    
    def test04_invalid_price_per_unit_should_raise_error(self):
        testing_isbn = '1234567891234'
        testing_quantity = 3
        invalid_price = -4

        with self.assertRaises(ValueError) as error:
            testing_book_purchase = BookPurchase(testing_isbn, testing_quantity, invalid_price)
        
        self.assertEqual('Price must be equal or greater to 0', str(error.exception))


if __name__ == '__main__':
    unittest.main()