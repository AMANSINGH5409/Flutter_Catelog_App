import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/cart.dart';
import '../../Models/catelog.dart';

class AddToCart extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Item Catelog;
  const AddToCart({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Catelog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(Catelog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: Catelog);
        }
      },
      style: ButtonStyle(
          // ignore: deprecated_member_use
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
