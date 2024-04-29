import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'listar_produtos.dart';

void main()async{
  runApp(ListarProdutos() as Widget);
}



/*
Future<void> main() async {
  Uri uri = Uri.https('jsonplaceholder.typicode.com', '/todos/');
  print(uri);
  final future = http.get(uri);
  future.then((response) {
    if (response.statusCode == 200) {
      print('Página carregada');

      var lista = json.decode(response.body) as List;
      var minhaLista = Todos(lista);

      minhaLista.todos.forEach((element) {
        print(element);
        var todo = Todo.fromJson(element as Map<String, dynamic>);
        print(todo.toJson());
      });
    } else {
      print('Erro');
    }
  });
}

class Todos {
  List todos = [];

  Todos(this.todos);
}


class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}

*/