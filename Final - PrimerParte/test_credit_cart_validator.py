from credit_card_validator import CreditCardValidator
import unittest

class TestCreditCardValidat(unittest.TestCase):
    def setUp(self):
        self.credit_card_validator = CreditCardValidator()

    def test00_return_true_with_valid_arguments(self):        
        credit_card_number = "1234"
        credit_card_expiration = "062021"
        credit_card_owner = "Persona Falsa"
        amount = "50.00"

        self.assertEqual(True, self.credit_card_validator.validate_credit_card(
            credit_card_number,
            credit_card_expiration,
            credit_card_owner,
            amount
        ))
    
    def test01_return_false_with_invalid_credit_card_number(self):
        invalid_credit_card_number = ""

        self.assertEqual(False, 
            self.credit_card_validator.validate_credit_card_number(
                invalid_credit_card_number
            )
        )
    
    def test02_return_false_with_invalid_credit_card_expiration_date_format(self):
        invalid_credit_card_expiration_date_format = "0223454"

        self.assertEqual(False, 
            self.credit_card_validator.validate_credit_card_expiration_date(
                invalid_credit_card_expiration_date_format
            )
        )
    
    def test03_return_false_with_expired_credit_card_expiration_date(self):
        expired_credit_card_expiration_date = "022020"

        self.assertEqual(False, 
            self.credit_card_validator.validate_credit_card_expiration_date(
                expired_credit_card_expiration_date
            )
        )
    
    def test04_return_false_with_invalid_credit_card_owner_name(self):
        invalid_credit_card_owner_name = ""

        self.assertEqual(False,
            self.credit_card_validator.validate_credit_card_owner_name(
                invalid_credit_card_owner_name
            )
        )
    
    def test05_return_false_with_invalid_transaction_amount(self):
        list_of_invalids_amounts = ["-23.00", "00.00", "23"]

        for invalid_amount in list_of_invalids_amounts:
            self.assertEqual(False,
                self.credit_card_validator.validate_transaction_amount(
                    invalid_amount
                )
            )

if __name__ == '__main__':
    unittest.main()
