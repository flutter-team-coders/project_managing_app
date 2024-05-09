import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managment_system/login_bloc/login_bloc.dart';
import 'package:project_managment_system/view/Sign_up.dart';
import 'package:project_managment_system/view/login.dart';

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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            SignUpPage(),
            LoginPage(),
          ],
        ),
      ),
    );
  }
}
