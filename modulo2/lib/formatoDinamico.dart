import 'dart:math'; // Importa a biblioteca dart:math para utilizar a classe Random
import 'package:flutter/material.dart'; // Importa o pacote flutter/material para usar os widgets do Flutter

void main() {
  runApp(MyApp()); // Inicia a aplicação Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forma e Cor Aleatória'), // Define o título da AppBar
        ),
        body: Container(
          color: Colors.grey.shade700, // Define a cor de fundo do corpo como cinza
          child: Center(
            child: ShapeChanger(), // Define o widget central como ShapeChanger
          ),
        ),
      ),
    );
  }
}

class ShapeChanger extends StatefulWidget {
  @override
  _ShapeChangerState createState() => _ShapeChangerState();
}

class _ShapeChangerState extends State<ShapeChanger> {
  bool _isCircle = true; // Variável para controlar se a forma é um círculo ou um quadrado
  Color _shapeColor = Colors.blue; // Variável para controlar a cor da forma
  String _randomPhrase = ''; // Variável para armazenar a frase aleatória

  void _toggleShape() {
    setState(() {
      _isCircle = !_isCircle; // Alterna entre círculo e quadrado
    });
  }

  void _changeColor() {
    setState(() {
      _shapeColor = _generateRandomColor(); // Gera uma nova cor aleatória
    });
  }

  // Função para gerar uma frase aleatória
  void _generateRandomPhrase() {
    final List<String> phrases = [ // Lista de frases possíveis
      'O sucesso é ir de fracasso em fracasso sem perder o entusiasmo.',
      'A única forma de fazer um excelente trabalho é amar o que você faz.',
      'A vida é o que acontece enquanto você está ocupado fazendo outros planos.',
      'Tudo que você pode imaginar é real.',
      'A vida é curta, sorria enquanto ainda tem dentes.'
    ];
    final Random random = Random();
    _randomPhrase = phrases[random.nextInt(phrases.length)]; // Seleciona uma frase aleatória da lista
    setState(() {});
  }

  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Gera um valor aleatório para o componente de vermelho (0-255)
      random.nextInt(256), // Gera um valor aleatório para o componente de verde (0-255)
      random.nextInt(256), // Gera um valor aleatório para o componente de azul (0-255)
      1, // Define a opacidade como 100%
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: _shapeColor, // Define a cor da forma
            shape: _isCircle ? BoxShape.circle : BoxShape.rectangle, // Define a forma como círculo ou retângulo
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _toggleShape(); // Altera entre círculo e quadrado ao pressionar o botão
          },
          child: Text(_isCircle ? 'Alterar para quadrado' : 'Alterar para círculo'), // Texto do botão
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _changeColor(); // Gera uma nova cor aleatória ao pressionar o botão
          },
          child: Text('Cor Aleatória'), // Texto do botão
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _generateRandomPhrase(); // Gera uma nova frase aleatória ao pressionar o botão
          },
          child: Text('Frase Aleatória'), // Texto do botão
        ),
        SizedBox(height: 10),
        Text(
          '$_randomPhrase', // Exibe a frase aleatória
          style: TextStyle(color: Colors.white, fontSize: 20), // Define a cor do texto como branca e o tamanho da fonte como 20
        ),
      ],
    );
  }
}
//Além do que o exercício pede, eu adicionei um botão com frases aleatórias.