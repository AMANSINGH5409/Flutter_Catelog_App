import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catelog/pages/home_detail_page.dart';
import '../../Models/catelog.dart';
import 'add_to_cart.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final Catelog = CatelogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailPage(catelogItem: Catelog))),
              child: CatelogItem(catelog: Catelog));
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      // ignore: unnecessary_null_comparison
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catelog.id.toString()),
            child: CatelogImage(catelogImg: catelog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg.bold.color(context.accentColor).make(),
            catelog.desc.text.gray400.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price}".text.xl.bold.make(),
                AddToCart(Catelog: catelog)
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150.0).make().py16();
  }
}
