import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catelog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending product".text.xl2.make(),
      ],
    );
  }
}
