import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
        "App Flutter ADS",
        )
      ),
      body: Container(
        height: 50,
        width: 500,
        color: Colors.red,
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () {
            setState(() {
                counter ++;
              });
          },
          ),
    );
  }
}