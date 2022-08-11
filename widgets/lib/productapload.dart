class Productapload {
  final int _id;
  final List _categories;
  final List _videos;
  final List _podcasts;
  final String _name;
  final String _author;
  final String _desc;
  final String _img;
  final String _date;
  final bool _exist;

  Productapload(this._id, this._categories, this._videos, this._podcasts,
      this._name, this._author, this._desc, this._img, this._date, this._exist);
  String get desc => _desc;
  List get videos => _videos;
  List get podcast => _podcasts;
  String get dete => _date;
  bool get exist => _exist;
  String get img => _img;
  String get author => _author;
  int get id => _id;
  String get name => _name;
  List get categories => _categories;
}
