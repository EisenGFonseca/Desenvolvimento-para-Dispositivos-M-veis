import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var container = Container(
        height: 150,
        width: 150,
        color: Colors.red,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 50,
            width: 50,
            color: Colors.green,
            child: Icon(Icons.remove_circle_outline),
        )));

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "App Flutter ADS",
      )),
      body: container,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
