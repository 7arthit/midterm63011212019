import 'package:flutter/material.dart';
import 'package:midterm63011212019/createform/create.dart';
import 'package:midterm63011212019/createform/edit.dart';
import 'package:midterm63011212019/databese/service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:midterm63011212019/model/profilemodel.dart';

class page_1 extends StatefulWidget {
  const page_1({Key? key}) : super(key: key);

  @override
  State<page_1> createState() => page_1State();
}

class page_1State extends State<page_1> {
  List<ProfileModel> proList = <ProfileModel>[];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ค'),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => p2_create(),
                ),
              ).then((value) {
                getAllData();
                setState(() {});
              });
            },
          ),
        ],
      ),
      body: Container(
          child: (proList.length != 0) ? ListView.builder(
              itemCount: proList.length,
              itemBuilder: (BuildContext buildContext, int index){
                return ListTile(
                  //leading: (proList[index].image.toString() != '')?
                  //Image.memory(base64.decode(proList[index].image),fit: BoxFit.fill,)
                  //    : Icon(Icons.person),
                  title: Text(proList[index].firstname +
                      " " +
                      proList[index].lastname),
                  subtitle: Text(proList[index].nickname),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new p2_edit(proList[index].id)
                            ),
                          ).then((value) {
                            getAllData();
                            setState(() {});
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          var service = DBService();
                          var result = await service.deleteData(proList[index].id);
                          getAllData();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              }
          ) : Container()
      ),
    );
  }

  getAllData() async{
    proList = <ProfileModel>[];
    var service = DBService();
    var profiles = await service.readData();
    print(profiles);
    profiles.forEach((pro){
      print(pro);
      setState((){
        var proModel = ProfileModel();
        proModel.id = pro['id']!;
        proModel.firstname = pro['firstname']!;
        proModel.lastname = pro['lastname']!;
        proModel.nickname = pro['nickname']!;
        //proModel.age = pro['age']!;
        //proModel.hometown = pro['hometown']!;
        //proModel.image = pro['image'];
        proList.add(proModel);
      });
    });
  }
}

