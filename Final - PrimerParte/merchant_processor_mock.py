from credit_card_validator import CreditCardValidator

class MerchantProcessorMock:
    def __init__(self, credit_card_validator):
        self._credit_card_validator = credit_card_validator
    
    def process_checkout(self, credit_card_number, credit_card_expiration,
                         credit_card_owner, transaction_amount):
        
        # Initial state
        final_process_status = 1
        final_process_msg = ''

        if not self._credit_card_validator.validate_credit_card_number(credit_card_number):
            final_process_msg = 'Invalid credit card number.'
        elif not self._credit_card_validator.self.validate_credit_card_expiration_date(credit_card_expiration):
            final_process_msg = 'Invalid credit card expiration date.'
        elif not self._credit_card_validator.validate_credit_card_owner_name(credit_card_owner):
            final_process_msg = 'Invalid credit card owner name.'
        elif not self._credit_card_validator.validate_transaction_amount(transaction_amount):
            final_process_msg = 'Invalid transaction amount.'

        # If there is no error
        else:
            final_process_msg = 'HARCODED_TRANSACTION_ID'
            final_process_status = 0
        
        return {
            'status': final_process_status,
            'msg': final_process_msg
        }
