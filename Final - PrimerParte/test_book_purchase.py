import unittest
from book_purchase import BookPurchase

class TestBookPurchase(unittest.TestCase):
    def test00_book_saves_correctly_the_isbn_and_quantity(self):
        testing_isbn = '1234567891234'
        testing_quantity = 1
        testing_book_purchase = BookPurchase(testing_isbn, testing_quantity)

        self.assertEqual(testing_isbn, testing_book_purchase.get_isbn())
        self.assertEqual(testing_quantity, testing_book_purchase.get_quantity())
    
    def test01_invalid_isbn_should_raise_error(self):
        ilegal_isbn = '1'
        testing_quantity = 1

        with self.assertRaises(ValueError) as error:
            testing_book_purchase = BookPurchase(ilegal_isbn, testing_quantity)
        
        self.assertEqual('Illegal ISBN', str(error.exception))
    
    def test02_invalid_quantity_should_raise_error(self):
        testing_isbn = '1234567891234'
        ilegal_quantity = 0

        with self.assertRaises(ValueError) as error:
            testing_book_purchase = BookPurchase(testing_isbn, ilegal_quantity)
        
        self.assertEqual('Quantity must be greater or equal to 1', str(error.exception))


if __name__ == '__main__':
    unittest.main()