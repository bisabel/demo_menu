import 'package:flutter/material.dart';
import 'package:menu/model/item.dart';
import 'package:menu/navigation.dart';
import 'package:menu/views/com/myAppBar.dart';

///A page which shows the image item and it text.
///It only navigates back to the grid page.
class ItemDetailPage extends StatelessWidget {

  Item item;
  ItemDetailPage(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        "Detail Page",
        () {
          NavigationConstant.navKey.currentState!.pop();
        }
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              item.urlImage,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
              },
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Center(child: Text("ERROR", style: Theme.of(context).textTheme.bodyText1,));                  
              }
              ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(22.0),
              color: Colors.green.withOpacity(0.5),
              child: Row(
                children: [
                  Text(item.name, style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            )
          )
        ],
      )
    );
  }


}