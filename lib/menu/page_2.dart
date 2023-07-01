import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midterm63011212019/main.dart';
import 'package:midterm63011212019/menu/page_4.dart';
import 'package:shared_preferences/shared_preferences.dart';


class page_2 extends StatefulWidget {
  const page_2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<page_2> createState() => page_2PageState();
}

class page_2PageState extends State<page_2> {
  final name_controller = TextEditingController();
  final lastname_controller = TextEditingController();
  final jungvat_controller = TextEditingController();
  final username_controller = TextEditingController();
  final email_controller = TextEditingController();
  final birthday_controller = TextEditingController();
  final image = TextEditingController();
  var img;
  late SharedPreferences Logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    Logindata = await SharedPreferences.getInstance();
    newuser = (Logindata.getBool('Login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => page_4()));
    }
  }

  @override
  void dispose() {
    name_controller.dispose();
    lastname_controller.dispose();
    jungvat_controller.dispose();
    username_controller.dispose();
    email_controller.dispose();
    username_controller.dispose();
    birthday_controller.dispose();
    image.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ก"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    child: Form(
    child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: name_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: lastname_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'lastname'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: jungvat_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'location'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: username_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: email_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: birthday_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'birthday'),
                ),
              ),
              PictureIcon(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  String name = name_controller.text;
                  String lastname = lastname_controller.text;
                  String jungvat = jungvat_controller.text;
                  String username = username_controller.text;
                  String email = email_controller.text;
                  String birthday = birthday_controller.text;
                  String img = birthday_controller.text;
                  if (name != '' && lastname != '' && jungvat != '' && username != '' && email != '' && birthday != '') {
                    print('Successfull');
                    Logindata.setBool('login', false);
                    Logindata.setString('username', username);
                    Logindata.setString('name', name);
                    Logindata.setString('lastname', lastname);
                    Logindata.setString('birthday', birthday);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  }
                },
                child: Text("Login"),
              ),
            ]
        ),
      ),
              ),
      ),
    );
  }
  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            (img == null)
                ? Icon(
              Icons.insert_photo,
              size: 50,
              color: Colors.greenAccent,
            )
                :Image.file(img),
            IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () async{
                  PickedFile? pickedfile = await ImagePicker().getImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                  String bit = base64.encode(await pickedfile!.readAsBytes());
                  image.text = bit;
                  if(pickedfile != null){
                    setState((){
                      img = File(pickedfile.path);
                    });
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}


