import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget(title: 'Aula ADS'));
}

class AppWidget extends StatelessWidget {
  final String? title;

  const AppWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title!,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black, fontSize: 100.00),
        ),
      ),
    );
  }
}
