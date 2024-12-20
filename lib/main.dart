import 'package:flutter/material.dart';
import 'package:test5/Screens/home_page.dart';


void main() async {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(search: '',),
      // home: SearchBarExample(),
    );
  }
}
