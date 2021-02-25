from catalog import Catalog

class BookPurchaseCatalog(Catalog):
    def __init__(self):
        Catalog.__init__(self)
    
    def get_book_by_isbn(self, isbn):
        for key, value in self._catalog.items():
            if value.get_isbn() == isbn:
                return value
        return False