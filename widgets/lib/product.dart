class Product{
  String _name;
  int _id;
  String _desc;
  String _img;

  String _auther;

  Product(this._name, this._id, this._desc, this._img, 
      this._auther);

  String get desc => _desc;

  

  String get img => _img;

  String get auther => _auther;

  int get id => _id;

  String get name => _name;


}