import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: ( _ ) => Pessoa(nome:'João', idade:30),
      child: MyApp(),
      ),
    );
}

class Pessoa with ChangeNotifier{
  String nome = 'João';
  int idade = 30;

  Pessoa ({required this.nome, required this.idade});

  get email => null;

  get telefone => null;

  get github => null;

  get tipoSanguineo => null;

  void incrementaIdade(){
    this.idade++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<Pessoa>(
        builder: (context, pessoa, child) => Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Exemplo provider')),
          ),
          body: Center(
            child: Text(
              pessoa.nome +
              ' tem ${pessoa.idade} anos de idade',
              style: TextStyle(fontSize: 30),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
            pessoa.incrementaIdade(),
          ),
        ),
      ),
    );
  }
}