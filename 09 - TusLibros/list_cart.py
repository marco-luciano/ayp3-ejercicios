class ListCart:
    def __init__(self, cart_id, cart_catalog):
        if cart_id in cart_catalog.key_list():
            self._cart = cart_catalog.get(cart_id)

            self.description = []
            for product in self._cart.get_products():
                element = {'isbn' : product.get_isbn(), 'quantity' : product.get_quantity()}
                self.description.append(element)
            self.code = 0
        else:
            self.code = 1
            self.description = 'Cart not found'
    
    def get_code(self):
        return self.code
    
    def get_description(self):
        return self.description