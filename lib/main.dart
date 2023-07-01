import 'package:flutter/material.dart';
import 'package:midterm63011212019/menu/page_1.dart';
import 'package:midterm63011212019/menu/page_2.dart';
import 'package:midterm63011212019/menu/page_3.dart';
import 'package:midterm63011212019/menu/page_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpdateDataStudentID',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    page_1(),
    page_2(title: '',),
    page_3(),
    page_4(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page1',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Page2',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Page3',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Page4',
              backgroundColor: Colors.greenAccent),
        ],
        onTap: (index){
          setState((){
            _currentIndex=index;
          });
        },
      ),
    );
  }
}

