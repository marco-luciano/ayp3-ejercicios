import uuid

class Catalog:
    def __init__(self):
        self._catalog = {}

    def add(self, element):
        if element.uuid() is None:
            self._catalog[str(uuid.uuid4())] = element
        else:
            self._catalog[element.uuid()] = element

    def get(self, uuid):
        return self._catalog[uuid]

    def delete(self, uuid):
        del self._catalog[uuid]

    def key_list(self):
        return self._catalog.keys()

