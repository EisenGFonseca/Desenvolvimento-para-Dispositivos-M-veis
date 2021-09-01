import 'package:flutter/material.dart';
import 'package:projeto_final/provider/livros.dart';
import 'package:projeto_final/routes/app_routes.dart';
import 'package:projeto_final/views/livro_form.dart';
import 'package:projeto_final/views/livro_form_cad.dart';
import 'package:projeto_final/views/livro_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) => Livros(),
      ),
    ],
    child: MaterialApp(
        title: 'Gerenciamento de Livros',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes : {
          AppRoutes.HOME: (_) => LivroList(),
          AppRoutes.LIVRO_FORM: (_) => LivroForm(),
          AppRoutes.LIVRO_FORM_CAD: (_) => LivroFormCad()
        }
      ),
    );
  }
}