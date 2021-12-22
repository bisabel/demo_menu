import 'package:flutter/material.dart';
import 'package:menu/navigation.dart';
import 'package:menu/views/initialPage.dart';
import 'package:url_strategy/url_strategy.dart';
void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          ///mainly use for the appbars
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white ),
          headline2: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white ),
          ///use for text
          bodyText1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black ),
          bodyText2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white ),
        )
      ),      
      home: const InitialPage(),
      initialRoute: NavigationConstant.Entry,
      onGenerateRoute: generateRoutes,
      navigatorKey: NavigationConstant.navKey,
    );
  }
}