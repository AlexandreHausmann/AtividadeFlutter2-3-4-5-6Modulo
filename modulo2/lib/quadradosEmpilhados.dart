import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap( // em vez de Row foi utilizado o Wrap
        spacing: 8.0, // Espaçamento horizontal entre os elementos
        runSpacing: 8.0, // Espaçamento vertical entre as linhas de elementos
        children: [
          Pilha(
            backgroundColor: Colors.grey,
            children: [
              Colors.redAccent.shade700,
              const Color.fromARGB(255, 57, 194, 62),
              const Color.fromARGB(255, 8, 126, 223),
            ],
          ),
          Pilha(
            backgroundColor: Colors.black,
            children: [
              Colors.cyan,
              Colors.purple,
              Colors.yellow,
            ],
          ),
          Pilha(
            children: [
              Colors.redAccent.shade700,
              Colors.yellowAccent.shade700,
              Colors.blueAccent.shade700,
            ],
          ),
          Pilha(
            backgroundColor: Colors.white,
            children: [
              Colors.deepPurpleAccent,
              Colors.deepOrangeAccent.shade400,
              Colors.yellowAccent,
              Colors.lightGreenAccent.shade400,
            ],
          ),
        ],
      ),
    );
  }
}

class Pilha extends StatelessWidget {
  const Pilha({
    this.backgroundColor,
    required this.children,
  });

  final Color? backgroundColor;
  final List<Color> children;

  @override
  Widget build(BuildContext context) {
    // Obter a largura da tela
    final screenWidth = MediaQuery.of(context).size.width;
    // Calcular a largura de cada item com base na largura da tela
    final itemWidth = (screenWidth - 3 * 8.0) / 4; // 3 * espaçamento entre os itens
    // A altura de cada item será a mesma que a largura, tornando-os quadrados
    final itemHeight = itemWidth;

    return Container(
      margin: const EdgeInsets.all(8), // Margem ao redor do contêiner
      color: backgroundColor, // Cor de fundo do contêiner
      width: itemWidth, // Largura do contêiner
      height: itemHeight, // Altura do contêiner
      child: Stack(
        children: [
          // Loop através das cores fornecidas e empilhe-as como retângulos sobrepostos
          for (var index = 0; index < children.length; index++)
            Positioned(
              // Posição do retângulo dentro do contêiner, ajustando a cada cor
              top: index * 8 + 8, // O valor é aumentado para empilhar os retângulos
              left: index * 8 + 8, // O valor é aumentado para empilhar os retângulos
              child: Container(
                width: itemWidth - 16, // Largura do retângulo (descontando a margem)
                height: itemHeight - 16, // Altura do retângulo (descontando a margem)
                color: children[index], // Cor do retângulo
              ),
            ),
        ],
      ),
    );
  }
}
//Para tornar o layout responsivo ao tamanho da tela tive que substituir o Row por um Wrap
//que permite que os elementos sejam organizados em várias 
//linhas conforme necessário para caber na largura da tela