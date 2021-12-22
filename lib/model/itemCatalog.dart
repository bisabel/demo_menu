
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:menu/model/item.dart';

class ItemCatalog {

  static const FILEDATA = "assets/data/foods.json";

  static Future<List<Item>> fetchData() async{
    final List data = await rootBundle.loadString(FILEDATA).then((String jsonString) => jsonDecode(jsonString));
    return data.map((value) => Item.fromJson(value) ).toList();
  } 
   
}