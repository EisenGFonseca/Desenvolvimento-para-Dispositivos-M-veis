import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:projeto_final/data/dummy_livros.dart';
import 'package:projeto_final/models/livro.dart';

class Livros with ChangeNotifier{
  final Map<String, Livro> _items = {...DUMMY_LIVROS};

  List<Livro> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Livro byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Livro livro){
    if(livro == null){
      return;
    }

    if(livro.id != null &&
       livro.id.trim().isNotEmpty &&
       _items.containsKey(livro.id)) {
      _items.update(
        livro.id,(_) => Livro(
          id: livro.id,
          name: livro.name,
          autor: livro.autor,
          categoria: livro.categoria,
          andamento: livro.andamento,
          capaUrl: livro.capaUrl,
        ),
      );
    } 
    //adicionar
    else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id, () => Livro(
          id: id,
          name: livro.name,
          autor: livro.autor,
          categoria: livro.categoria,
          andamento: livro.andamento,
          capaUrl: livro.capaUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Livro livro){
    if(livro != null && livro.id != null){
      _items.remove(livro.id);
      notifyListeners();
    }
  }

}