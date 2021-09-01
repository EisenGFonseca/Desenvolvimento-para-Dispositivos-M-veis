import 'package:flutter/material.dart';
import 'package:projeto_final/components/livro_tile.dart';
import 'package:projeto_final/provider/livros.dart';
import 'package:projeto_final/routes/app_routes.dart';
import 'package:provider/provider.dart';

class LivroList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Livros livros = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.LIVRO_FORM
              );
            }
          ),
        ]
      ),
      body: ListView.builder(
        itemCount: livros.count,
        itemBuilder: (ctx, i) => LivroTile(livros.byIndex(i)),
        )
    );
  }
}