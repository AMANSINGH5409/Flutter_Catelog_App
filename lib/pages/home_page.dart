import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/Models/cart.dart';
import 'dart:convert';
import 'package:flutter_catelog/Models/catelog.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catelog_header.dart';
import '../widgets/home_widgets/catelog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/files/catelog.json");
    var decodedData = jsonDecode(catelogJson);
    var productsData = decodedData["Products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          // ignore: deprecated_member_use
          backgroundColor: context.theme.buttonColor,
        ).badge(
          color: Vx.gray400,
          size: 20,
          count: _cart.items.length,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatelogHeader(),
              // ignore: unnecessary_null_comparison
              if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                const CatelogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
