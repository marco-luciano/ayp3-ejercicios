class BookPurchase:
    def __init__(self, isbn, quantity):
        self._validate_isbn(isbn)
        self._validate_quantity(quantity)

        self._isbn = isbn
        self._quantity = quantity
    
    def _validate_isbn(self, isbn_to_validate):
        if len(str(isbn_to_validate)) != 13:
            raise ValueError('Illegal ISBN')
        

    def _validate_quantity(self, quantity_to_validate):
        if quantity_to_validate < 1:
            raise ValueError('Quantity must be greater or equal to 1')

    def get_isbn(self):
        return self._isbn
    
    def get_quantity(self):
        return self._quantity