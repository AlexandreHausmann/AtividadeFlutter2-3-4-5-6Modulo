import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'produtos_model.dart';

class ListarProdutos extends StatefulWidget {
  ListarProdutos({Key? key}) : super(key: key);

  @override
  _ListarProdutosState createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  Future<List<Produto>?> _getProdutos() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    print(uri);

    var response = await http.get(uri);
    var dados = json.decode(response.body) as List;

    List<Produto> produtos = [];

    dados.forEach((elemento) {
      Produto produto = Produto(
        elemento['produto_id'],
        elemento['produto'],
        elemento['endereco'],
        elemento['descricao'],
        elemento['imagem'],
        int.parse(elemento['quantidade']),
        double.parse(elemento['preço']),
      );

      produtos.add(produto);
    });

    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: FutureBuilder(
          future: _getProdutos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      leading: Image.network(snapshot.data[indice].imagem),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data[indice].produto}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'R\$${snapshot.data[indice].preco.toString()}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text(snapshot.data[indice].descricao
                              .toString()
                              .substring(0, 30) +
                          '...'),
                      onTap: () {
                        print(
                            'O produto selecionado foi ${snapshot.data[indice].produto},');
                      },
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
