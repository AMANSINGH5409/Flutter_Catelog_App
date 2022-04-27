import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Catelog App"),
        ),
        body: Center(
          child: Container(
            child: const Text("Welcome to 30 days Flutter App Development."),
          ),
        ),
        drawer: const Drawer(),
      ),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),
      // darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
