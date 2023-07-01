import 'package:flutter/material.dart';
import 'package:midterm63011212019/status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class page_4 extends StatefulWidget {
  const page_4({Key? key}) : super(key: key);

  @override
  State<page_4> createState() => page_4State();
}

class page_4State extends State<page_4> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ง"),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_outlined),
            color: Colors.black,
            onPressed: () async {
              SharedPreferences prefernces = await SharedPreferences.getInstance();
              prefernces.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                      (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(children: <Widget>[
            Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.analytics,
                      size: 50.0,
                      color: Colors.black,
                    ),
                    textColor: Colors.black,
                    title: Text("สถานะ"),
                    subtitle: Text("ดูสถานะการเข้าใช้งาน"),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        child: Text('Enter'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => status()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


