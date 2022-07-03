import 'product.dart';

class ShoppingBasketData {
static ShoppingBasketData ?_instance;
  List<Product> _basketItems;

    ShoppingBasketData(this._basketItems) {
    _basketItems = <Product>[];
  }

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static ShoppingBasketData? getInstance() {
    _instance ??= ShoppingBasketData(<Product>[]);

    return _instance;
  }
}