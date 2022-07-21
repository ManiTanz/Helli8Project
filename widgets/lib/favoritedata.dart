import 'productapload.dart';

class favoritedata{
static favoritedata ?_instance;
  List<Productapload> _basketItems;

    favoritedata(this._basketItems) {
    _basketItems = <Productapload>[];
  }

  List<Productapload> get basketItems => _basketItems;

  set basketItems(List<Productapload> value) {
    _basketItems = value;
  }

  static favoritedata? getInstance() {
    _instance ??= favoritedata(<Productapload>[]);

    return _instance;
  }
}