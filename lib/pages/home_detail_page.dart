import 'package:flutter/material.dart';
import 'package:flutter_catelog/Models/catelog.dart';
import 'package:flutter_catelog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelogItem;

  const HomeDetailPage({Key? key, required this.catelogItem})
      : assert(catelogItem != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelogItem.price}".text.xl4.red800.bold.make(),
            AddToCart(Catelog: catelogItem).wh(140, 50),
          ],
        ).p20(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelogItem.id.toString()),
                    child:
                        Image.network(catelogItem.image).centered().scale105())
                .h24(context)
                .py8(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catelogItem.name.text.xl4.bold
                        .color(context.accentColor)
                        .make(),
                    catelogItem.desc.text.gray400.make(),
                    10.heightBox,
                    "Nunc facilisis tincidunt felis, vel eleifend lectus pharetra at. Proin arcu felis, lacinia et luctus sed, congue ac diam. Mauris id luctus felis, in ultrices ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam erat nulla, maximus at ante id, pulvinar feugiat tortor. Phasellus arcu mauris, congue sed iaculis."
                        .text
                        .coolGray400
                        .make()
                        .p8(),
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
