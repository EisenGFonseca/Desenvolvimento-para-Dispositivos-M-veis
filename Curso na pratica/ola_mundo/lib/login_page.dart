import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                Image.network(
                  'https://img.icons8.com/ios/100/000000/lock-screen.png'
                ),
                SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onChanged: (text) => email = text,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onChanged: (text) => senha = text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (email == 'eisen.fonseca@gmail.com' &&
                            senha == '12345') {
                          print('Login correto');
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          print('Login errado');
                        }
                      },
                      child: Text('Login')),
                ],
              ))),
    ));
  }
}
