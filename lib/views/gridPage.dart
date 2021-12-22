import 'package:flutter/material.dart';
import 'package:menu/model/item.dart';
import 'package:menu/navigation.dart';
import 'package:menu/views/com/dialogYesOrNo.dart';
import 'package:menu/views/com/itemGridWidget.dart';
import 'package:menu/views/com/myAppBar.dart';
import 'package:menu/views/itemDetailPage.dart';
import 'package:menu/model/itemCatalog.dart';

///Show a grid with 6 components.
class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  _GridpageState createState() => _GridpageState();

}

class _GridpageState extends State<GridPage> {

  static const double DOUBLEPADDING = 20.0;
  ///for use as padding between elements of the grid
  static const EdgeInsets PADDING = EdgeInsets.all(DOUBLEPADDING);

  List<Item> _list = [];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ItemCatalog.fetchData()
    .then((value) => setState(() {
      _list = value;
    })
    );
  }

  ///Implements the logic when is allow navigate back.
  ///Will call when user click back in the appbar icon, or browser or android back button
  Future<bool> navigateBack(BuildContext context) async {
    if ( _scaffoldKey.currentState?.isEndDrawerOpen == true) {
      NavigationConstant.navKey.currentState!.pop();
      return false;
    } 
    else {
      bool result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogYesOrNo()
      );
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => navigateBack(context),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(
          "Catalog Page",
          () async {
            bool result = await navigateBack(context);
            if ( result ) 
              NavigationConstant.navKey.currentState!.pop();
          }
        ),
        body: GridView.builder(
          padding: PADDING,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: DOUBLEPADDING,
                  mainAxisSpacing: DOUBLEPADDING), 
          itemCount: _list.length,
          itemBuilder:  (context, index) => ItemGridWidget(_list[index]),
        ),
        endDrawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('EndDrawer', style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}