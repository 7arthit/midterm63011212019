import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midterm63011212019/databese/service.dart';
import 'package:midterm63011212019/model/profilemodel.dart';

class p2_edit extends StatefulWidget {
  List<ProfileModel> profileList = <ProfileModel>[];
  late int id;

  p2_edit(int id){
    this.id = id;
  }

  p2_edit.setText(List<ProfileModel> profileList, int id){
    this.profileList = profileList;
    this.id = id;
  }

  @override
  State<p2_edit> createState() => _p2_editState(id);
}

class _p2_editState extends State<p2_edit> {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var nickname = TextEditingController();
  //var age = TextEditingController();
  //var hometown = TextEditingController();
  //var image = TextEditingController();
  //var img;
  DBService service = new DBService();
  late ProfileModel pro;
  late int id;
  List<ProfileModel> profileList = <ProfileModel>[];

  _p2_editState(int id){
    this.profileList = profileList;
    this.id = id;
    getDataProfile(id);
  }

  getDataProfile(int id) async {
    var profile = await service.readDataById(id);
    profile.forEach((pro){
      setState((){
        firstname.text = pro['firstname'];
        lastname.text = pro['lastname'];
        nickname.text = pro['nickname'];
        //age.text = pro['age'];
        //hometown = pro['hometown'];
        //image.text = pro['image'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PictureIcon(),

                //Container(
                //  width: 200,
                //  child: Column(
                 //   children: <Widget>[
                //      (image.text != '')
                //          ?
                //      Image.memory(base64.decode(image.text), fit: BoxFit.fill,)
                //          : Icon(Icons.insert_photo),
                //      IconButton(
                //          icon: const Icon(Icons.camera_alt),
                //          onPressed: () async {
                //            PickedFile? pickedFile = await ImagePicker().getImage(
                //              source: ImageSource.gallery,
                //              maxHeight: 1800,
                //              maxWidth: 1800,
                //            );
                //            String bit = base64.encode(await pickedFile!.readAsBytes());
                //            image.text = bit;
                //            if(pickedFile != true){
                //              setState((){
                //                image.text = bit;
                //              });
                //            }
                //          }
                //      ),
                //    ],
                //  ),
                //),

                textHeader('Profile'),
                textFormF('name', 'Input your name', firstname, TextInputType.text),
                textFormF('country', 'Input your country', lastname, TextInputType.text),
                textFormF('probability', 'Input probability', nickname, TextInputType.text),
                //textFormF('Age', 'Input your age', age, TextInputType.number),
                //textFormF('Hometown', 'Input your hometown', hometown, TextInputType.text),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Text(
                            'Update Data',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: (){
                            DBService service = new DBService();
                            ProfileModel profile = new ProfileModel();
                            profile.firstname = firstname.text;
                            profile.lastname = lastname.text;
                            profile.nickname = nickname.text;
                            //profile.age = age.text;
                            //profile.hometown = hometown.text;
                            //profile.image = image.text;
                            var data = profile.profileMap();

                            service.updataData(data, id);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding textFormF(String lText, String hText, TextEditingController controller, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
            labelText: lText,
            hintText: hText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
      ),
    );
  }

  Padding textHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.insert_photo,
        size: 100,
        color: Colors.greenAccent,
      ),
    );
  }
}
