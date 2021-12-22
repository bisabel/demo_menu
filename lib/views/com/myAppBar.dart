import 'package:flutter/material.dart';

///Appbar for use in all pages.
///Always shows the back icon button
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Function function;

  const MyAppBar(this.title, this.function, {Key? key})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  ///Use as the function that trigger when onPressed Icon Button leading
  void onPressed() => function();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.headline1),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.headline1?.color),
        onPressed: onPressed,
      ),
    );
  }

}