from credit_card_validator import CreditCardValidator

class MerchantProcessorMock:
    def __init__(self, credit_card_validator):
        self._credit_card_validator = credit_card_validator
    
    def process_checkout(self, credit_card_number, credit_card_expiration,
                         credit_card_owner, transaction_amount):

        return self._credit_card_validator.validate_credit_card(
            credit_card_number,
            credit_card_expiration,
            credit_card_owner,
            transaction_amount
        )
