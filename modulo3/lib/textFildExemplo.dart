import 'package:flutter/material.dart';

enum Genero {
  Masculino,
  Feminino,
  Outros
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String senha = '';
  bool aceitoTermos = false;
  Genero genero = Genero.Outros;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Página de Cadastro')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                onChanged: (text) {
                  setState(() {
                    senha = text;
                  });
                },
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text('Masculino'),
                    leading: Radio<Genero>(
                      value: Genero.Masculino,
                      groupValue: genero,
                      onChanged: (Genero? value) {
                        setState(() {
                          genero = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Feminino'),
                    leading: Radio<Genero>(
                      value: Genero.Feminino,
                      groupValue: genero,
                      onChanged: (Genero? value) {
                        setState(() {
                          genero = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Outros'),
                    leading: Radio<Genero>(
                      value: Genero.Outros,
                      groupValue: genero,
                      onChanged: (Genero? value) {
                        setState(() {
                          genero = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: aceitoTermos,
                    onChanged: (checked) {
                      setState(() {
                        aceitoTermos = checked!;
                      });
                    },
                  ),
                  Text('Concordo com os termos de uso do app'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print('Entrar pressionado');
                  print('Email: $email');
                  print('Senha: $senha');
                  print('Gênero: $genero');
                  if (!aceitoTermos) {
                    print('Não aceitou os termos de uso do app');
                  }
                },
                child: Text('Entrar'),
              ),
              Text('Esqueci a senha'),
            ],
          ),
        ),
      ),
    );
  }
}
