import 'package:flutter/foundation.dart';

class Product{
  final String _name;
  final int _id;
  final String _desc;
  final String _img;
  final String _author;
  final List _catagories;

  Product(this._name, this._id, this._desc, this._img, 
      this._author, this._catagories);

  String get desc => _desc;

  

  String get img => _img;

  String get author => _author;

  int get id => _id;

  String get name => _name;
  List get categories => _catagories;

}