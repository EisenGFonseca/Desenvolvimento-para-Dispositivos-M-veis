import 'package:flutter/material.dart';
import 'package:projeto_final/provider/users.dart';
import 'package:projeto_final/routes/app_routes.dart';
import 'package:projeto_final/views/user_form.dart';
import 'package:projeto_final/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) => Users(),
      ),
    ],
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes : {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        }
      ),
    );
  }
}