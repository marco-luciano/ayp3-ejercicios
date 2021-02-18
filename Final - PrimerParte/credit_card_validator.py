from datetime import datetime

class CreditCardValidator:
    def __init__(self):
        pass

    def validate_credit_card_number(self, card_number):
        return len(str(card_number)) != 0
    
    def validate_credit_card_expiration_date(self, card_expiration_date):
        return len(str(card_expiration_date)) == 6 and self.validate_if_expiration_date_expired(card_expiration_date)
    
    def validate_if_expiration_date_expired(self, expiration_date_string):
        expiration_date = datetime.strptime(expiration_date_string, '%m%Y')

        if expiration_date > datetime.today():
            return True
        else:
            return False
    
    def validate_credit_card_owner_name(self, name):
        return len(str(name)) != 0
    
    def validate_transaction_amount(self, transaction_amount):
        amount_split = str(transaction_amount).split(".")

        if len(amount_split) != 2:
            return False

        return self.validate_whole_number_of_transaction_amount(amount_split[0]) and \
            self.validate_decimal_number_of_transtaction_amount(amount_split[1])
        
    def validate_whole_number_of_transaction_amount(self, whole_number):
        amount = int(whole_number)
        
        if amount <= 0 or len(str(amount)) > 15:
            return False
        
        return True
    
    def validate_decimal_number_of_transtaction_amount(self, decimal_number):
        return len(decimal_number) == 2 and decimal_number.isdecimal()

    def validate_credit_card(self, card_number, card_expiration_date, card_owner, transaction_amount):
        final_process_msg = ''

        if not self.validate_credit_card_number(card_number):
            final_process_msg = 'Invalid credit card number.'
        elif not self.validate_credit_card_expiration_date(card_expiration_date):
            final_process_msg = 'Invalid credit card expiration date.'
        elif not self.validate_credit_card_owner_name(card_owner):
            final_process_msg = 'Invalid credit card owner name.'
        elif not self.validate_transaction_amount(transaction_amount):
            final_process_msg = 'Invalid transaction amount.'

        return {
            'status' : final_process_msg == '',
            'msg' : final_process_msg
        }
