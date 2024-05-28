import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_bloc/login_bloc.dart';
import 'sign_up_bloc/sign_up_bloc.dart';
import 'view/home_page.dart';
import 'view/login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginInfo>(
          create: (_) => LoginInfo(),
        ),
        Provider<SignupInfo>(
          create: (_) => SignupInfo(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    String? token = prefs.getString('authToken');

    _isAuthenticated = token != null;
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? HomePage() : LoginPage();
  }
}
