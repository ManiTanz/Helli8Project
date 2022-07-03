import 'product.dart';

class ShoppingBasketData {
static ShoppingBasketData _instance;
  List<Product> _basketItems;

  ShoppingBasketData() {
    _basketItems = <Product>[];
  }

  List<Product> get asketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static ShoppingBasketData getInstance() {
    if (_instance == null) {
      _instance = ShoppingBasketData();
    }

    return _instance;
  }
}