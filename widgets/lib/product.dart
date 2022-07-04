class Product{
  final String _name;
  final int _id;
  final String _desc;
  final String _img;
  final String _auther;

  Product(this._name, this._id, this._desc, this._img, 
      this._auther);

  String get desc => _desc;

  

  String get img => _img;

  String get auther => _auther;

  int get id => _id;

  String get name => _name;


}