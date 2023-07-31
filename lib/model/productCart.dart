class CartProduct {
  Map<int, dynamic> _products = {};
  Map<int, dynamic> get products => _products;
  set addCart(Map<int, dynamic> product) {
    if (_products.containsKey(product.keys.first) == true) {
      _products[product.keys.first]['jumlah'] += 1;
    } else {
      _products.addAll(product);
    }
  }

  set removeSingleCart(int id) {
    _products[id]['jumlah'] -= 1;
  }

  set removeAllCart(int id) {
    _products.remove(id);
  }
}
