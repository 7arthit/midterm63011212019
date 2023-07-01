import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class page_3 extends StatefulWidget {
  @override
  State<page_3> createState() => page_3State();
}

class page_3State extends State<page_3> {
  late String _selectedItem;
  var categoryItemList = [];

  void initState() {
    getAllcategory();
    super.initState();
  }

  Future<List> getAllcategory() async {
    Uri url = Uri.parse('https://api.nationalize.io/?name=nathaniel');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        categoryItemList = jsonData;
      });
      return categoryItemList;
    } else {
      throw Exception('We are NOT! able to download the json data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                width: 360,
                height: 450,
                child: Container(
                  decoration:
                  BoxDecoration(
                      border: Border.all(color: Colors.green)
                  ),
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                      future: getAllcategory(),
                      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (ConnectionState.active != null && !snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            itemCount: categoryItemList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                subtitle:
                                Text(categoryItemList[index]['name']),
                                title:
                                Text(categoryItemList[index]['country_id']),
                                isThreeLine: true,
                                onTap: () { },
                              );
                            }
                        );
                      }
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
