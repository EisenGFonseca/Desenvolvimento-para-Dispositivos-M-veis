import 'package:flutter/material.dart';

import 'app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Flutter ADS - Eisen Fonseca",
        ),
        actions: [CustomSwitch()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          //scrollDirection: Axis.horizontal,
          children: [
            Center(child: CustomSwitch()),
            Container(
              height: 100,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ]),
          ],
        ),
      ),
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

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDark,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
