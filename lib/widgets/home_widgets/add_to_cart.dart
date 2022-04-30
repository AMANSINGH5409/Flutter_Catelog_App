import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/cart.dart';
import '../../Models/catelog.dart';

class AddToCart extends StatefulWidget {
  final Item Catelog;
  const AddToCart({
    Key? key,
    required this.Catelog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.Catelog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catelog = CatelogModel();
          _cart.catelog = _catelog;
          _cart.add(widget.Catelog);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
