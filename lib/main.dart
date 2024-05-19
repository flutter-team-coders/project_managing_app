import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_bloc/login_bloc.dart';
import 'sign_up_bloc/sign_up_bloc.dart';
import 'view/home_page.dart';
import 'view/login_page.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<String> authenticate(
      {required String email, required String password}) async {
    try {
      final response = await dio.post('https://yourapi.com/api/login', data: {
        'email': email,
        'password': password,
      });
      return response.data['token'];
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }

  Future<String> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final response =
          await dio.post('https://yourapi.com/api/register', data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      });
      return response.data['token'];
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<UserRepository>(
          create: (_) => UserRepository(),
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
          create: (context) => LoginBloc(
            userRepository: context.read<UserRepository>(),
          ),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(
            userRepository: context.read<UserRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
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
    String? token = prefs.getString('authToken');
    setState(() {
      _isAuthenticated = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? HomePage() : LoginPage();
  }
}
