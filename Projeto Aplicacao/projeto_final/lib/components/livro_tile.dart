import 'package:flutter/material.dart';
import 'package:projeto_final/models/livro.dart';
import 'package:projeto_final/provider/livros.dart';
import 'package:projeto_final/routes/app_routes.dart';
import 'package:provider/provider.dart';

class LivroTile extends StatelessWidget {

final Livro livro;

const LivroTile(this.livro);

  @override
  Widget build(BuildContext context) {
    final avatar = livro.capaUrl == null || livro.capaUrl.isEmpty
   
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(livro.capaUrl));
   
    return ListTile(
      leading: avatar,
      title: Text(livro.name),
      subtitle: Text(livro.autor),
      trailing: Container(
        width: 100,
        child: Row(
          children:<Widget>[
            IconButton(
            icon: Icon(Icons.edit),
            color:Colors.orange,
            onPressed: () {
                Navigator.of(context).pushNamed(
                AppRoutes.LIVRO_FORM,
                arguments: livro,
              );
            }
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) =>  AlertDialog(
                  title: Text('Exlcuir o Livro'),
                  content: Text('Tem certeza?'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                      ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                      ),
                  ],
                ) 
              ).then((confirmed){
                if (confirmed){
                  Provider.of<Livros>(context, listen: false).remove(livro);
                }
              });
            }
          ),
          ],
        )
      )
    );
  }
}