import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();
  final TextEditingController _controladorPeso = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _exibirSnackBar(String mensagem) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Criando um formulário'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
            ),
            TextField(
              controller: _controladorIdade,
            ),
            TextField(
              controller: _controladorAltura,
            ),
            TextField(
              controller: _controladorPeso,
            ),
            ElevatedButton(
                onPressed: () {
                  _exibirSnackBar('O formulário está sendo processado');
                  final String nome = _controladorNome.text;
                  final int idade = int.parse(_controladorIdade.text);
                  final double altura = double.parse(_controladorAltura.text);
                  final double peso = double.parse(_controladorPeso.text);

                  final Pessoa pessoaNova = Pessoa(nome, idade, altura, peso);
                  print(pessoaNova);
                },
                child: Text('Registrar'))
          ],
        ),
      ),
    );
  }
}

class Pessoa {
  final String nome;
  final int idade;
  final double altura;
  final double peso;

  Pessoa(this.nome, this.idade, this.altura, this.peso);

  @override
  String toString() {
    return 'Pessoa{nome: $nome, idade: $idade, altura: $altura, peso: $peso}';
  }
}
