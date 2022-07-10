import 'product.dart';

class favoritedata{
static favoritedata ?_instance;
  List<Product> _basketItems;

    favoritedata(this._basketItems) {
    _basketItems = <Product>[];
  }

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static favoritedata? getInstance() {
    _instance ??= favoritedata(<Product>[]);

    return _instance;
  }
}