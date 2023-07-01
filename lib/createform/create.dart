import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midterm63011212019/databese/service.dart';
import 'package:midterm63011212019/model/profilemodel.dart';

class p2_create extends StatefulWidget {
  @override
  State<p2_create> createState() => _p2_createState();
}

class _p2_createState extends State<p2_create> {

  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var nickname = TextEditingController();
  //var age = TextEditingController();
  //var hometown = TextEditingController();
  //var image = TextEditingController();
  //var img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Form'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //PictureIcon(),

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
                            'Add Data',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: (){
                            DBService service = new DBService();
                            ProfileModel profile = new ProfileModel();
                            // profile.id;
                            profile.firstname = firstname.text;
                            profile.lastname = lastname.text;
                            profile.nickname = nickname.text;
                            //profile.age = age.text;
                            //profile.hometown = hometown.text;
                            //profile.image = image.text;
                            var data = profile.profileMap();

                            service.insertData(data);
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
            borderRadius: BorderRadius.circular(20),
          ),
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

  // Padding PictureIcon() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       width: 200,
  //       child: Column(
  //         children: <Widget>[
  //           (img == null)
  //               ? Icon(
  //             Icons.insert_photo,
  //             size: 200,
  //             color: Colors.greenAccent,
  //           )
  //               :Image.file(img),
  //           IconButton(
  //               icon: const Icon(Icons.camera_alt),
  //               onPressed: () async{
  //                 PickedFile? pickedfile = await ImagePicker().getImage(
  //                   source: ImageSource.gallery,
  //                   maxWidth: 1800,
  //                   maxHeight: 1800,
  //                 );
  //                 String bit = base64.encode(await pickedfile!.readAsBytes());
  //                 image.text = bit;
  //                 if(pickedfile != null){
  //                   setState((){
  //                     img = File(pickedfile.path);
  //                   });
  //                 }
  //               }
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
