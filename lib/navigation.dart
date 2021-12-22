
import 'package:flutter/material.dart';
import 'package:menu/model/item.dart';
import 'package:menu/views/gridPage.dart';
import 'package:menu/views/initialPage.dart';
import 'package:menu/views/itemDetailPage.dart';

class NavigationConstant {
  static final navKey = new GlobalKey<NavigatorState>();

  static const String Entry = "/initial";
  static const String Carousel = "/catalog";
  static const String ItemDetail = "/catalog/item";
}

Route generateRoutes(RouteSettings settings){  
  switch (settings.name){
    case NavigationConstant.Entry:
      return buildRoute(settings, InitialPage());
    case NavigationConstant.Carousel:
      return buildRoute(settings, GridPage());  
    case NavigationConstant.ItemDetail:{
      Item item = settings.arguments as Item;
      return buildRoute(settings, ItemDetailPage(item));  
    }                 
    default:
      return buildRoute(settings, InitialPage()); 
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder){  
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) {
      return builder;
    }
  );
}