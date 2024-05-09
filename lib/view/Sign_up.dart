import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managment_system/bloc/app_bloc.dart';
import 'package:project_managment_system/login_bloc/login_bloc.dart';

import 'package:project_managment_system/view/login.dart';

class SignUpInfo {
  String firstname;
  String lastname;
  String email;
  String password;
  SignUpInfo({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  SignUpInfo copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
  }) {
    return SignUpInfo(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
    };
  }

  factory SignUpInfo.fromMap(Map<String, dynamic> map) {
    return SignUpInfo(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpInfo.fromJson(String source) =>
      SignUpInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpInfo(firstname: $firstname, lastname: $lastname, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant SignUpInfo other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A324D),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  width: 288,
                  height: 438,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xffD9D9D9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Text(
                        '  First name',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 226,
                          height: 43,
                          child: TextField(
                            controller: firstname,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff77C1C1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1B2F6C)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'First name',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '  Last name',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 226,
                          height: 43,
                          child: TextField(
                            controller: lastname,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff77C1C1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1B2F6C)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'Last name',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '  Email',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 226,
                          height: 43,
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff77C1C1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1B2F6C)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'Example@gmail.com',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '  Password',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 226,
                          height: 43,
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff77C1C1),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1B2F6C)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Icon(Icons.check_box),
                          Text(
                            '  Remember me',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is Success) {
                      context.read<AppBloc>().add(SignedUp());
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<LoginBloc>().add(SignUp(
                          user: SignUpInfo(
                              firstname: firstname.text,
                              lastname: lastname.text,
                              email: email.text,
                              password: password.text)));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 283,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffFFEACD),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff0A324D),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account?',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          ' Sign Up',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffA3F9F9)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 105,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/bear.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
