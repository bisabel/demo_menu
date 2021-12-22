
import 'package:flutter/material.dart';
import 'package:menu/model/item.dart';
import 'package:menu/navigation.dart';

///Box square widget that shows an image Item and its name
///Has a 1 sec fade transition
class ItemGridWidget extends StatefulWidget {
  final Item item;
  ItemGridWidget(this.item)
    :super(key: Key("ItemGridWidget"+item.name));

  @override
  _ItemGridWidgetState createState() => _ItemGridWidgetState();

}

class _ItemGridWidgetState extends State<ItemGridWidget> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationConstant.navKey.currentState!.pushNamed(NavigationConstant.ItemDetail, arguments: widget.item), 
      child: FadeTransition(
        opacity: _animation,
        child: Container(
           decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(widget.item.urlImage),
                    onError: (error, stackTrace) => Container(),
                    fit:BoxFit.cover
                  ),
           ),
          child: Center(
            child: Text(
              widget.item.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      )
    );
  }
  
}