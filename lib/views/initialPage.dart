import 'package:flutter/material.dart';
import 'package:menu/navigation.dart';
import 'package:menu/views/com/myAppBar.dart';

///Initial page. Will be the first page that the web app show.
///Can navigate to grid page if the button is pressed.
///No effect when press back icon.
class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Initial Page", (){}),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(  
                onPressed: () => NavigationConstant.navKey.currentState!.pushNamed(NavigationConstant.Carousel),            
                child: const Text('Access'),
              ),
            ],
          )
        ]
      )
    );
  }


}