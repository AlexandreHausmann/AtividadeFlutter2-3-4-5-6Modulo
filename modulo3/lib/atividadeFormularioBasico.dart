import 'package:flutter/material.dart';

// Definindo uma cor personalizada
const Color corPersonalizada = Color.fromARGB(255, 100, 99, 99);

void main() {
  runApp(MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo um tema escuro com a cor de fundo marrom
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: corPersonalizada,
      ),
      // Removendo o banner de depuração
      debugShowCheckedModeBanner: false,
      // Definindo a tela inicial como um Scaffold contendo o widget FormExample
      home: Scaffold(
        body: FormExample(),
      ),
    );
  }
}

// Classe que representa o formulário
class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

// Classe que gerencia o estado do formulário
class _FormExampleState extends State<FormExample> {
  // Chave global para identificar e validar o formulário
  final _formKey = GlobalKey<FormState>();
  // Controladores para os campos de texto do nome e da idade
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  // Variável para controlar o estado do Checkbox Ativo/Inativo
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Campo de texto do nome
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
            validator: (value) {
              // Lógica de validação do campo de texto do nome
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um nome.';
              }
              if (value.length < 3 || !RegExp(r'^[A-Z]').hasMatch(value)) {
                return 'O nome deve conter pelo menos 3 letras e começar com letra maiúscula.';
              }
              return null;
            },
          ),
          // Campo de texto da idade
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Idade',
            ),
            validator: (value) {
              // Lógica de validação do campo de texto da idade
              if (value == null || value.isEmpty) {
                return 'Por favor, insira a idade.';
              }
              final idade = int.tryParse(value) ?? 0;
              if (idade < 18) {
                return 'A idade deve ser um número válido maior ou igual a 18.';
              }
              return null;
            },
          ),
          // Checkbox Ativo/Inativo
          Row(
            children: [
              Checkbox(
                value: _isActive,
                onChanged: (value) {
                  // Lógica para atualizar o estado do Checkbox Ativo/Inativo
                  setState(() {
                    _isActive = value!;
                  });
                },
              ),
              Text(_isActive ? 'Ativo' : 'Inativo'),
            ],
          ),
          SizedBox(height: 20),
          // Botão "Salvar" para enviar o formulário
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Implementação da lógica de envio do formulário aqui
                _showSavedData();
              }
            },
            child: Text('Salvar'),
          ),
          SizedBox(height: 20),
          // Widget para mostrar os dados salvos
          Container(
            padding: EdgeInsets.all(10),
            color: _isActive ? Colors.green : Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dados Salvos:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nome: ${_nameController.text}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Idade: ${_ageController.text}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Status: ${_isActive ? 'Ativo' : 'Inativo'}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para exibir os dados salvos
  void _showSavedData() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Dados Salvos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${_nameController.text}'),
              Text('Idade: ${_ageController.text}'),
              Text('Status: ${_isActive ? 'Ativo' : 'Inativo'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Liberando os controladores dos campos de texto quando o widget é descartado
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}