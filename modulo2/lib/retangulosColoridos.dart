import 'package:flutter/material.dart'; // Importação do pacote flutter/material.dart, que contém os widgets do Flutter

void main() {
  runApp(MyApp()); // Função principal que inicia a execução do aplicativo
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp é um widget que configura o aplicativo
      home: Scaffold( // Scaffold é um layout básico de tela do Material Design
        appBar: AppBar( // AppBar é a barra de aplicativos na parte superior da tela
          title: Text('Layout da Imagem'), // Título da barra de aplicativos
        ),
        body: Container( // Container é um widget que contém outros widgets e fornece estilos, margens, preenchimento, etc.
          color: Colors.grey, // Cor de fundo do container (cinza)
          padding: EdgeInsets.all(8), // Preenchimento interno do container (8 pixels em todos os lados)
          child: Column( // Column é um widget que organiza seus filhos em uma coluna vertical
            crossAxisAlignment: CrossAxisAlignment.center, // Alinhamento dos widgets filhos no eixo transversal (centro)
            children: [ // Lista de widgets filhos da coluna
              Row( // Row é um widget que organiza seus filhos em uma linha horizontal
                mainAxisAlignment: MainAxisAlignment.center, // Alinhamento dos widgets filhos no eixo principal (centro)
                children: [
                  _buildColoredBox(Colors.red), // Chama a função _buildColoredBox para criar um quadrado vermelho
                  _buildColoredBox(Colors.green), // Chama a função _buildColoredBox para criar um quadrado verde
                  _buildColoredBox(Colors.blue), // Chama a função _buildColoredBox para criar um quadrado azul
                ],
              ),
              SizedBox(height: 8), // Espaço entre as linhas
              Row( // Segunda linha de quadrados
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildColoredBox(Colors.purple), // Chama a função _buildColoredBox para criar um quadrado roxo
                  _buildColoredBox(Colors.cyan), // Chama a função _buildColoredBox para criar um quadrado ciano
                  _buildColoredBox(Colors.black), // Chama a função _buildColoredBox para criar um quadrado preto
                ],
              ),
              SizedBox(height: 8), // Espaço entre as linhas
              Row( // Linha de retângulos
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildColoredRect(Colors.purple), // Chama a função _buildColoredRect para criar um retângulo roxo
                  _buildColoredRect(Colors.cyan), // Chama a função _buildColoredRect para criar um retângulo ciano
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para construir um quadrado colorido
  Widget _buildColoredBox(Color color) {
    return Container( // Container que representa o quadrado
      margin: const EdgeInsets.all(8), // Margem ao redor do quadrado
      width: 50, // Largura do quadrado
      height: 50, // Altura do quadrado
      color: color, // Cor do quadrado
    );
  }

  // Função para construir um retângulo colorido
  Widget _buildColoredRect(Color color) {
    return Container( // Container que representa o retângulo
      margin: const EdgeInsets.all(8), // Margem ao redor do retângulo
      width: 50, // Largura do retângulo
      height: 100, // Altura do retângulo
      color: color, // Cor do retângulo
    );
  }
}
