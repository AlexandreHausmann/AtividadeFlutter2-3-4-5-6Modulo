import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Cores',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 75, 73, 73), // Definindo a cor de fundo
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ColorListScreen(),
        '/detail': (context) => ColorDetailScreen(),
      },
    );
  }
}

class ColorItem {
  final Color color;
  final String name;
  final String reference;

  ColorItem({
    required this.color,
    required this.name,
    required this.reference,
  });
}

class ColorListScreen extends StatelessWidget {
  final List<ColorItem> colors = [
    ColorItem(
      color: Colors.redAccent.shade700,
      name: 'Vermelho',
      reference: 'Coração, Morango, Maçã',
    ),
    ColorItem(
      color: Colors.greenAccent.shade700,
      name: 'Verde',
      reference: 'Folhas, Grama, Limão',
    ),
    ColorItem(
      color: Colors.blueAccent.shade700,
      name: 'Azul',
      reference: 'Céu, Mar, BlueBerry',
    ),
    ColorItem(
      color: Colors.purpleAccent.shade700,
      name: 'Roxo',
      reference: 'Uva, Berinjela',
    ),
    ColorItem(
      color: Colors.orangeAccent.shade700,
      name: 'Laranja',
      reference: 'Laranja, Cenoura, Abobora ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 73, 73),
        title: Text('Lista de cores'),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final colorItem = colors[index];
          return ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: colorItem,
              );
            },
            title: Text(
              colorItem.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              colorItem.reference,
              style: TextStyle(color: Colors.white),
            ),
            tileColor: colorItem.color,
          );
        },
      ),
    );
  }
}

class ColorDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorItem colorItem = ModalRoute.of(context)!.settings.arguments as ColorItem;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 73, 73),
        title: Text('Cor selecionada'),
      ),
      body: Container(
        color: colorItem.color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                colorItem.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${colorItem.reference}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar para a Lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}