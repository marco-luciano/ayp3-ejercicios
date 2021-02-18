class BookPurchase:
    def __init__(self, isbn, quantity, price_per_unit):
        self._validate_isbn(isbn)
        self._validate_quantity(quantity)
        self._validate_price(price_per_unit)

        self._isbn = isbn
        self._quantity = quantity
        self._price_per_unit = price_per_unit
    
    def _validate_isbn(self, isbn_to_validate):
        if len(str(isbn_to_validate)) != 13:
            raise ValueError('Illegal ISBN')    

    def _validate_quantity(self, quantity_to_validate):
        if quantity_to_validate < 1:
            raise ValueError('Quantity must be greater or equal to 1')

    def _validate_price(self, price_per_unit):
        if price_per_unit < 0:
            raise ValueError('Price must be equal or greater to 0')
    
    def get_isbn(self):
        return self._isbn
    
    def get_quantity(self):
        return self._quantity
    
    def get_total_price(self):
        return self._price_per_unit * self._quantity