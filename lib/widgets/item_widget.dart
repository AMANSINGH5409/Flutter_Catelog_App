import 'package:flutter/material.dart';
import 'package:flutter_catelog/Models/catelog.dart';

class ItemWidgets extends StatelessWidget {
  final Item item;

  const ItemWidgets({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // print("${item.name}");
        },
        leading: Image.network(
          item.image,
          height: 35,
          width: 35,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
              color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
