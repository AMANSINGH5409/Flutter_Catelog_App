import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/Models/catelog.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatelogList().expand()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ));
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final Catelog = CatelogModel.items[index];
          return CatelogItem(catelog: Catelog);
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatelogImage(catelogImg: catelog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
            catelog.desc.text.gray400.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price}".text.xl.bold.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).white.rounded.square(150.0).make().py16();
  }
}

class CatelogImage extends StatelessWidget {
  final String catelogImg;

  const CatelogImage({Key? key, required this.catelogImg})
      : assert(catelogImg != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(catelogImg).box.rounded.p8.make().p16().w32(context);
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending product".text.xl2.make(),
      ],
    );
  }
}



// ListView.builder(
//                 itemCount: CatelogModel.items.length,
//                 itemBuilder: (context, index) {
//                   return ItemWidgets(
//                     item: CatelogModel.items[index],
//                   );
//                 },
//               )
