import 'package:flutter/material.dart';
import 'package:project_managing_system/view/create_project.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:dotted_border/dotted_border.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A324D),
      appBar: AppBar(
        backgroundColor: Color(0xff0A324D),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('authToken');

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset('assets/images/osscam.png'),
          InkWell(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateProjectPage()))
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
                  'Create',
                  style: TextStyle(fontSize: 30, color: Color(0xff0A324D)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          DottedBorder(
            color: Color(0xffFFEACD),
            radius: Radius.circular(10),
            dashPattern: [10, 10],
            borderType: BorderType.RRect,
            child: Container(
              width: 283,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xff0A324D),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Text('data');
                          });
                    },
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.add,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Join',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  )
                ],
              )),
            ),
          ),
        ],
      )),
    );
  }

  inkwell({required Container child}) {}
}
