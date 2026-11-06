import 'package:flutter/material.dart';

class Pesquisareceita extends StatefulWidget {
  const Pesquisareceita({super.key});

  @override
  State<Pesquisareceita> createState() => _PesquisareceitaState();
}

class _PesquisareceitaState extends State<Pesquisareceita> {
  final campo = TextEditingController();
  String ? erro;
  String resultado = '';

  void pesquisar() {
    String texto = campo.text.trim();
    setState(() {
      if(texto.isEmpty){
        erro = 'Digite o nome de uma receita';
        resultado = '';
      }else {
        erro = null;
        resultado = 'Você Pesquisou por $texto';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar Receitas'),),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: campo,
              decoration: InputDecoration(
                labelText: 'Nome da Receita',
                errorText: erro,
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: pesquisar, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white) ,child: Text('Pesquisar')),
          ],
        ),
      ),
    );
  }
}

