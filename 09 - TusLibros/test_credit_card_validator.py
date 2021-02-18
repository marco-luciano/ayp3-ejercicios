from credit_card_validator import CreditCardValidator
import unittest

class TestCreditCardValidat(unittest.TestCase):
    def setUp(self):
        self.credit_card_validator = CreditCardValidator()

        self.credit_card_number = "1234"
        self.credit_card_expiration = "062021"
        self.credit_card_owner = "Persona Falsa"
        self.amount = "50.00"

    def test00_return_true_with_valid_arguments(self):        
        self.assertEqual(True, self.credit_card_validator.validate_credit_card(
            self.credit_card_number,
            self.credit_card_expiration,
            self.credit_card_owner,
            self.amount
        )['status'])
    
    def test01_return_false_with_invalid_credit_card_number(self):
        invalid_credit_card_number = ""

        status = self.credit_card_validator.validate_credit_card(
            invalid_credit_card_number,
            self.credit_card_expiration,
            self.credit_card_owner,
            self.amount
        )
        
        self.assertEqual(False, status['status'])
        self.assertEqual('Invalid credit card number.', status['msg'])
    
    def test02_return_false_with_invalid_credit_card_expiration_date_format(self):
        invalid_credit_card_expiration_date_format = "0223454"
        
        status = self.credit_card_validator.validate_credit_card(
            self.credit_card_number,
            invalid_credit_card_expiration_date_format,
            self.credit_card_owner,
            self.amount
        )

        self.assertEqual(False, status['status'])
        self.assertEqual('Invalid credit card expiration date.', status['msg'])
    
    def test03_return_false_with_expired_credit_card_expiration_date(self):
        expired_credit_card_expiration_date = "022020"

        status = self.credit_card_validator.validate_credit_card(
            self.credit_card_number,
            expired_credit_card_expiration_date,
            self.credit_card_owner,
            self.amount
        )

        self.assertEqual(False, status['status'])
        self.assertEqual('Invalid credit card expiration date.', status['msg'])
    
    def test04_return_false_with_invalid_credit_card_owner_name(self):
        invalid_credit_card_owner_name = ""

        status = self.credit_card_validator.validate_credit_card(
            self.credit_card_number,
            self.credit_card_expiration,
            invalid_credit_card_owner_name,
            self.amount
        )

        self.assertEqual(False, status['status'])
        self.assertEqual('Invalid credit card owner name.', status['msg'])
    
    def test05_return_false_with_invalid_transaction_amount(self):
        list_of_invalids_amounts = ["-23.00", "00.00", "23"]

        for invalid_amount in list_of_invalids_amounts:
            status = self.credit_card_validator.validate_credit_card(
                self.credit_card_number,
                self.credit_card_expiration,
                self.credit_card_owner,
                invalid_amount
            )

            self.assertEqual(False, status['status'])
            self.assertEqual('Invalid transaction amount.', status['msg'])



if __name__ == '__main__':
    unittest.main()
