import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  String imageUrl =
      "https://cdn.pixabay.com/photo/2016/11/29/05/45/astronomy-1867616__480.jpg";

  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // ignore: deprecated_member_use
        color: context.theme.buttonColor,
        child: ListView(
          children: [
            Container(
              color: Colors.transparent,
              child: DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                    margin: const EdgeInsets.all(0),
                    accountName: const Text("Aman Rajan Singh"),
                    accountEmail: const Text("amansingh@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  )),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.white,
              ),
              title: Text("My Wishlist",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
              title: Text("My Cart",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
