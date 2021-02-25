from cart import Cart
from catalog import Catalog

class AddToCart:
    def __init__(self, cart_id, book_isbn, book_quantity, cart_catalog, book_purchase_catalog):
        if cart_id in cart_catalog.key_list():
            self._cart = cart_catalog.get(cart_id)
            self._book_purchase = book_purchase_catalog.get_book_by_isbn(book_isbn)

            if self._book_purchase is False:
                self.code = 1
                self.description = "Product not found"
            else:    
                self._book_quantity = book_quantity
                add_item = self._cart.add_item(self._book_purchase)
                self.code = add_item['code']
                self.description = add_item['description']
        else:
            self.code = 1
            self.description = "Cart not found"
    
    def get_code(self):
        return self.code

    def get_description(self):
        return self.description
