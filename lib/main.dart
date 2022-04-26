import 'package:flutter/material.dart';
import 'package:flutter_catelog/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int days = 30;

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
