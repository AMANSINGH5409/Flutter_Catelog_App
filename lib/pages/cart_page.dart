import 'package:flutter/material.dart';
import 'package:flutter_catelog/Models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: const {RemoveMutation},
            notifications: const {},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            },
          ),
          30.heightBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder()),
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.xl.color(Colors.white).make(),
          ).wh(100, 50),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Notihing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Image.network(_cart.items[index].image).wh(45, 45),
              trailing: IconButton(
                onPressed: () => RemoveMutation(item: _cart.items[index]),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
