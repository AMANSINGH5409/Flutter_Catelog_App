import 'package:flutter/material.dart';
import 'package:flutter_catelog/Models/catelog.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelogItem;

  const HomeDetailPage({Key? key, required this.catelogItem})
      : assert(catelogItem != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelogItem.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.xl.make())
                .wh(100, 50),
          ],
        ).p20(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelogItem.id.toString()),
                    child:
                        Image.network(catelogItem.image).centered().scale105())
                .h32(context)
                .py8(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: MyTheme.creamColor,
                child: Column(
                  children: [
                    catelogItem.name.text.xl4.bold
                        .color(MyTheme.darkBluishColor)
                        .make(),
                    catelogItem.desc.text.gray400.make(),
                    10.heightBox
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
