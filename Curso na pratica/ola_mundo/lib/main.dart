import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget(title: 'Aula ADS'));
}

class AppWidget extends StatelessWidget {
  final String? title;

  const AppWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Container(
        child: Center(
          child: Text('Material App')
        )
      )
    );
  }
}
