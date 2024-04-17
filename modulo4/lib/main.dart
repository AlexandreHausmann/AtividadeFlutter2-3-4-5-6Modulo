import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Argumentos {
  final int id;
  final String nome;

  Argumentos(this.id, this.nome);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Tela1(),
        Tela2.RouteName: (context) => Tela2(),
      },
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int valor = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        backgroundColor: const Color.fromARGB(255, 45, 190, 50),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir para Tela 2'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Tela2.RouteName,
              arguments: Argumentos(1, 'Alexandre $valor'),
            );
            valor++;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 121, 179, 123), // Cor do botão
          ),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  static const String RouteName = '/tela2';

  const Tela2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)?.settings.arguments as Argumentos?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2 ${argumentos?.nome ?? ""}'),
        backgroundColor: const Color.fromARGB(255, 221, 36, 23),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 233, 114, 106), // Cor do botão
          ),
          child: Text('Retornar para Tela 1'),
        ),
      ),
    );
  }
}
