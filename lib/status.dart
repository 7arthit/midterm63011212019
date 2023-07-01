import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class status extends StatefulWidget {
  const status({Key? key}) : super(key: key);

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  late SharedPreferences logindata;
  late String name;
  late String lastname;
  late String username;
  late String birthday;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      name = logindata.getString('name')!;
      lastname = logindata.getString('lastname')!;
      username = logindata.getString('username')!;
      birthday = logindata.getString('birthday')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared Preferences"),
          backgroundColor: Colors.greenAccent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text('Name : $name ',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  Text('Lastname : $lastname',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text('User : $username ',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text('BirthDay: $birthday',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                    ]
                  )
            )
        );
  }
}

