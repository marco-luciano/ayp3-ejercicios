import unittest
from customer import Customer

class TestCustomer(unittest.TestCase):
    def test01_new_customer(self):
        # user y pass
        new_customer = Customer('Foo', '1234')
        self.assertEqual('Foo', new_customer.user())
    
if __name__ == '__main__':
    unittest.main()