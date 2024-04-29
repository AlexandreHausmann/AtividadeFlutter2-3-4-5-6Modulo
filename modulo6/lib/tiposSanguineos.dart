import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 78, 99, 121);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  Color get cor {
    switch (tipoSanguineo) {
      case TipoSanguineo.aPositivo:
        return Colors.blue;
      case TipoSanguineo.aNegativo:
        return Colors.red;
      case TipoSanguineo.bPositivo:
        return Colors.purple;
      case TipoSanguineo.bNegativo:
        return Colors.orange;
      case TipoSanguineo.oPositivo:
        return Colors.green;
      case TipoSanguineo.oNegativo:
        return Colors.yellow;
      case TipoSanguineo.abPositivo:
        return Colors.cyan;
      case TipoSanguineo.abNegativo:
        return Colors.white;
    }
  }
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void editar(Pessoa pessoaExistente, Pessoa pessoaNova) {
    final index = _listaDePessoas.indexOf(pessoaExistente);
    if (index != -1) {
      _listaDePessoas[index] = pessoaNova;
      notifyListeners();
    }
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }
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
        body: Center(
          child: TelaInicial(),
        ),
      ),
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaListaPessoas()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.grey[300], // Altera a cor do botão para grey[300]
            minimumSize: Size(300, 100), // Aumenta o tamanho do botão
          ),
          icon:Icon (Icons.list,  color: Colors.black,),
          label: Text(
            'Ver lista de pessoas',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20), // Aumenta o tamanho da fonte
          ),
        ),
        SizedBox(height: 40), // Aumenta o espaçamento entre os botões
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaIncluirEditarPessoa()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.grey[300], // Altera a cor do botão para grey[300]
            minimumSize: Size(300, 100), // Aumenta o tamanho do botão
          ),
          icon:Icon(Icons.person, color: Colors.black,),
          label: Text(
            'Incluir nova pessoa',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20), // Aumenta o tamanho da fonte
          ),
        ),
      ],
    );
  }
}

class TelaListaPessoas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listaDePessoas = Provider.of<EstadoListaDePessoas>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: listaDePessoas.pessoas.length,
        itemBuilder: (context, index) {
          final pessoa = listaDePessoas.pessoas[index];

          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome: ${pessoa.nome}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: pessoa.cor),
                ),
                Text(
                  'E-mail: ${pessoa.email}',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Telefone: ${pessoa.telefone}',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Link do GitHub: ${pessoa.github}',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Tipo Sanguíneo: ${_getTipoSanguineoString(pessoa.tipoSanguineo)}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.black,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaEditarPessoa(pessoa: pessoa),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExcluirPessoa(pessoa: pessoa),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getTipoSanguineoString(TipoSanguineo tipoSanguineo) {
    switch (tipoSanguineo) {
      case TipoSanguineo.aPositivo:
        return "A+";
      case TipoSanguineo.aNegativo:
        return "A-";
      case TipoSanguineo.bPositivo:
        return "B+";
      case TipoSanguineo.bNegativo:
        return "B-";
      case TipoSanguineo.oPositivo:
        return "O+";
      case TipoSanguineo.oNegativo:
        return "O-";
      case TipoSanguineo.abPositivo:
        return "AB+";
      case TipoSanguineo.abNegativo:
        return "AB-";
    }
  }
}

class ExcluirPessoa extends StatelessWidget {
  final Pessoa pessoa;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ExcluirPessoa({Key? key, required this.pessoa}) : super(key: key);

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _linkGitHubController = TextEditingController();
  TipoSanguineo? _tipoSanguineo;

  @override
  Widget build(BuildContext context) {
    _nomeController.text = pessoa.nome;
    _emailController.text = pessoa.email;
    _telefoneController.text = pessoa.telefone;
    _linkGitHubController.text = pessoa.github;
    _tipoSanguineo = pessoa.tipoSanguineo;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Excluír Pessoa')),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome é obrigatório.';
                    }
                    if (value.length < 3) {
                      return 'Nome precisa ter pelo menos 3 letras.';
                    }
                    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                      return 'Nome precisa começar com letra maiúscula.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "E-mail obrigatório.";
                    }
                    if (!value!.contains('@')) {
                      return "E-mail inválido.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _telefoneController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Telefone",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Telefone obrigatório.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _linkGitHubController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "GitHub",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "GitHub obrigatório.";
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  value: _tipoSanguineo,
                  decoration: InputDecoration(
                    labelText: 'Tipo Sanguíneo',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  items: TipoSanguineo.values.map((tipo) {
                    return DropdownMenuItem(
                      value: tipo,
                      child: Text(
                        _getTipoSanguineoString(tipo),
                        style: TextStyle(
                          color: _getColorForBloodType(
                              tipo), // Altera a cor do texto do tipo sanguíneo
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged:null,
                ),
                SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<EstadoListaDePessoas>(context, listen: false)
                        .excluir(pessoa);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete, color: Colors.black,),
                  label: Text('Excluír'),
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TelaIncluirEditarPessoa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incluir Pessoa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TelaFormulario(),
      ),
    );
  }
}

class TelaEditarPessoa extends StatelessWidget {
  final Pessoa pessoa;

  const TelaEditarPessoa({Key? key, required this.pessoa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Pessoa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TelaFormulario(editando: true, pessoa: pessoa),
      ),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  final bool editando;
  final Pessoa? pessoa;

  const TelaFormulario({Key? key, this.editando = false, this.pessoa})
      : super(key: key);

  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneController;
  late TextEditingController _githubController;
  late TipoSanguineo _tipoSanguineoSelecionado;

  @override
  void initState() {
    super.initState();
    _nomeController =
        TextEditingController(text: widget.editando ? widget.pessoa!.nome : '');
    _emailController = TextEditingController(
        text: widget.editando ? widget.pessoa!.email : '');
    _telefoneController = TextEditingController(
        text: widget.editando ? widget.pessoa!.telefone : '');
    _githubController = TextEditingController(
        text: widget.editando ? widget.pessoa!.github : '');
    _tipoSanguineoSelecionado = widget.editando
        ? widget.pessoa!.tipoSanguineo
        : TipoSanguineo.aPositivo;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          controller: _nomeController,
          decoration: InputDecoration(
            labelText: 'Nome Completo',
            labelStyle: TextStyle(color: Colors.black),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira o nome.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'E-mail',
            labelStyle: TextStyle(color: Colors.black),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira o e-mail.';
            }
            if (!value.contains('@')) {
              return 'O e-mail deve conter o caractere @.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _telefoneController,
          decoration: InputDecoration(
            labelText: 'Telefone',
            labelStyle: TextStyle(color: Colors.black),
          ),
          keyboardType:
              TextInputType.phone, // Define o tipo de teclado para números
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira o telefone.';
            }
            // Verifica se o valor contém apenas dígitos
            if (value.contains(RegExp(r'[^0-9]'))) {
              return 'O telefone deve conter apenas números.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _githubController,
          decoration: InputDecoration(
            labelText: 'Link do GitHub',
            labelStyle: TextStyle(color: Colors.black),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira o link do GitHub.';
            }
            return null;
          },
        ),
        DropdownButtonFormField(
          value: _tipoSanguineoSelecionado,
          decoration: InputDecoration(
            labelText: 'Tipo Sanguíneo',
            labelStyle: TextStyle(color: Colors.black),
          ),
          items: TipoSanguineo.values.map((tipo) {
            return DropdownMenuItem(
              value: tipo,
              child: Text(
                _getTipoSanguineoString(tipo),
                style: TextStyle(
                  color: _getColorForBloodType(
                      tipo), // Altera a cor do texto do tipo sanguíneo
                ),
              ),
            );
          }).toList(),
          onChanged: (TipoSanguineo? value) {
            if (value != null) {
              setState(() {
                _tipoSanguineoSelecionado = value;
              });
            }
          },
        ),
        SizedBox(height: 60),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final pessoa = Pessoa(
                nome: _nomeController.text,
                email: _emailController.text,
                telefone: _telefoneController.text,
                github: _githubController.text,
                tipoSanguineo: _tipoSanguineoSelecionado,
              );
              if (widget.editando) {
                Provider.of<EstadoListaDePessoas>(context, listen: false)
                    .editar(widget.pessoa!, pessoa);
              } else {
                Provider.of<EstadoListaDePessoas>(context, listen: false)
                    .incluir(pessoa);
              }
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.grey[300], // Define a cor de fundo para o botão
          ),
          child: Text(
            widget.editando ? 'Salvar Alterações' : 'Salvar',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ]),
    );
  }

}

String _getTipoSanguineoString(TipoSanguineo tipoSanguineo) {
  switch (tipoSanguineo) {
    case TipoSanguineo.aPositivo:
      return "A+";
    case TipoSanguineo.aNegativo:
      return "A-";
    case TipoSanguineo.bPositivo:
      return "B+";
    case TipoSanguineo.bNegativo:
      return "B-";
    case TipoSanguineo.oPositivo:
      return "O+";
    case TipoSanguineo.oNegativo:
      return "O-";
    case TipoSanguineo.abPositivo:
      return "AB+";
    case TipoSanguineo.abNegativo:
      return "AB-";
  }
}

Color _getColorForBloodType(TipoSanguineo tipoSanguineo) {
  switch (tipoSanguineo) {
    case TipoSanguineo.aPositivo:
      return Colors.blueAccent;
    case TipoSanguineo.aNegativo:
      return Colors.redAccent;
    case TipoSanguineo.bPositivo:
      return Colors.purpleAccent;
    case TipoSanguineo.bNegativo:
      return Colors.orangeAccent;
    case TipoSanguineo.oPositivo:
      return Colors.greenAccent;
    case TipoSanguineo.oNegativo:
      return Colors.yellowAccent;
    case TipoSanguineo.abPositivo:
      return Colors.cyanAccent;
    case TipoSanguineo.abNegativo:
      return Colors.white;
  }
}
