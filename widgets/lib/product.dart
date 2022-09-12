class Product {
  final String _name;
  final int _id;
  final String _desc;
  final String _img;
  final int _author;
  final List _catagories;
  final String _topic;

  Product(this._name, this._id, this._author, this._img, this._catagories,
      this._desc, this._topic);
  String get desc => _desc;
  String get img => _img;
  int get author => _author;
  int get id => _id;
  String get name => _name;
  List get categories => _catagories;
  String get topic => _topic;
}
