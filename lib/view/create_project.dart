import 'package:flutter/material.dart';

class CreateProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A324D),
      appBar: AppBar(
        backgroundColor: Color(0xff0A324D),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/osscam.png'),
                  ),
                ),
              ),
              Text(
                '   Project name:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 310,
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1B2F6C)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '   Project script:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 316,
                  height: 400,
                  child: TextField(
                    maxLines: 15,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1B2F6C)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText:
                            "Enterprise equipment management system \nThrough which information is stored All types of equipment available And all maintenance operations are with Possibility of issuing reports and statement"),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5),
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
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff0A324D)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
