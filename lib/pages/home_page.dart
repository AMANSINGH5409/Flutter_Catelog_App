import 'package:flutter/material.dart';
import 'package:flutter_catelog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: const Text("Flutter App Development."),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
