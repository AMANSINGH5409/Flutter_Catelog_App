import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
