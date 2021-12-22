import 'package:flutter/material.dart';
import 'package:menu/navigation.dart';

///Dialog widget that ask the user ¿Do you want go to the initial page?
///It will return a bool with the user's answer
class DialogYesOrNo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("¿Do you want go to the initial page?", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(  
                  onPressed: () => NavigationConstant.navKey.currentState!.pop(true),            
                  child: const Text('Yes'),
                ),
                TextButton(  
                  onPressed: () => NavigationConstant.navKey.currentState!.pop(false),            
                  child: const Text('No'),
                )
              ]
            ),
          ),
        ],
      ),);
  }

}