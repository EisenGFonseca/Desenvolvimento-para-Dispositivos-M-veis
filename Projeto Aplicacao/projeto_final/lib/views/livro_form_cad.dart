import 'package:flutter/material.dart';
import 'package:projeto_final/provider/livros.dart';
import 'package:provider/provider.dart';
import 'package:projeto_final/models/livro.dart';

class LivroFormCad extends StatefulWidget {

  @override
  _LivroFormCadState createState() => _LivroFormCadState();
}

class _LivroFormCadState extends State<LivroFormCad> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

    void _loadFormData(Livro livro){
      if(livro != null){
        _formData['id'] = livro.id;
        _formData['name'] = livro.name;
        _formData['autor'] = livro.autor;
        _formData['categoria'] = livro.categoria;
        _formData['andamento'] = livro.andamento;
        _formData['capaUrl'] = livro.capaUrl;
      }
    }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final livro = ModalRoute.of(context)!.settings.arguments as Livro?;
   
    if(livro!=null){
    _loadFormData(livro);
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Livro'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();

                  Provider.of<Livros>(context, listen: false).put(Livro(
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    autor: _formData['autor'].toString(),
                    categoria: _formData['categoria'].toString(),
                    andamento: _formData['andamento'].toString(),
                    capaUrl: _formData['capaUrl'].toString(),
                  ));

                  Navigator.of(context).pop();
                }
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(children: <Widget>[
            TextFormField(
              initialValue: _formData['name'],
              decoration: InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Informe um título';
                }
                return null;
              },
              onSaved: (value) => _formData['name'] = value!,
            ),

            TextFormField(
              initialValue: _formData['autor'],
              decoration: InputDecoration(labelText: 'Autor'),
              onSaved: (value) => _formData['autor'] = value!,
            ),

            TextFormField(
              initialValue: _formData['categoria'],
              decoration: InputDecoration(labelText: 'Categoria'),
              onSaved: (value) => _formData['categoria'] = value!,
            ),

            TextFormField(
              initialValue: _formData['andamento'],
              decoration: InputDecoration(labelText: 'Andamento da leitura'),
              onSaved: (value) => _formData['andamento'] = value!,
            ),

            TextFormField(
              initialValue: _formData['capaUrl'],
              decoration: InputDecoration(labelText: 'Url da capa do livro'),
              onSaved: (value) => _formData['capaUrl'] = value!,
            )
          ]),
        ),
      ),
    );
  }
}