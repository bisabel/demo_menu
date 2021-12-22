import 'package:flutter/material.dart';

class Item {

  final String name;
  final String urlImage;

  Item( 
    String this.name, 
    String this.urlImage
  );

  Item.fromJson(Map<String,dynamic> parsedJson): 
    this.name = parsedJson['name'],
    this.urlImage = parsedJson['urlImage'];

}