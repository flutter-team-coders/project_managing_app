import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managing_system/sign_up_bloc/sign_up_bloc.dart';
import 'package:project_managing_system/sign_up_bloc/sign_up_event.dart';
import 'package:project_managing_system/sign_up_bloc/sign_up_state.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A324D),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) async {
          if (state is SignUpSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign up successfully')),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign up failed. Please try again.')),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 200),
                    Container(
                      width: 288,
                      height: 520,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffD9D9D9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 75),
                          Text('  First Name', style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 226,
                              height: 43,
                              child: TextField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff77C1C1),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1B2F6C)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: 'First Name',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('  Last Name', style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 226,
                              height: 43,
                              child: TextField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff77C1C1),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1B2F6C)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: 'Last Name',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('  Email', style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 226,
                              height: 43,
                              child: TextField(
                                controller: emailController,
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
                          SizedBox(height: 10),
                          Text('  Password', style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 226,
                              height: 43,
                              child: TextField(
                                controller: passwordController,
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
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Icon(Icons.check_box),
                              Text('  Remember me',
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 75),
                    InkWell(
                      onTap: () {
                        final firstName = firstNameController.text;
                        final lastName = lastNameController.text;
                        final email = emailController.text;
                        final password = passwordController.text;
                        context.read<SignUpBloc>().add(SignUp(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password));
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
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30, color: Color(0xff0A324D)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(' Login',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffA3F9F9))),
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
        ),
      ),
    );
  }
}
