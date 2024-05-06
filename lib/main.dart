import 'package:flutter/material.dart';
import 'package:project_managment_system/Sign_up.dart';
import 'package:project_managment_system/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SignUpPage(),
          LoginPage(),
        ],
      ),
    );
  }
}
