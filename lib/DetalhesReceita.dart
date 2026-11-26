import 'package:flutter/material.dart';
import 'package:untitled/Receita.dart';
import 'package:untitled/Utils/ListaFavoritos.dart';

class DetalhesReceita extends StatefulWidget {
  const DetalhesReceita({super.key, required this.receita});
  final Receita receita;

  @override
  State<DetalhesReceita> createState() => _DetalhesReceitaState();
}

class _DetalhesReceitaState extends State<DetalhesReceita> {
  @override
  Widget build(BuildContext context) {
    final receita = widget.receita;

    String tempo = 'Tempo total: não informado';
    if (receita.tempoTotal != null) {
      tempo = 'Tempo total: ${receita.tempoTotal} min';
    }

    String porcoes = '';
    if (receita.porcoes != null) {
      porcoes = 'Porções: ${receita.porcoes}';
    }

    String ingredientes = 'Ingredientes Indisponíveis';
    if (receita.ingredientes.isNotEmpty) {
      ingredientes = receita.ingredientes.join('\n');
    }

    String instrucoes = 'Instruções Indisponíveis';
    if (receita.instrucoes.isNotEmpty) {
      instrucoes = receita.instrucoes.join('\n\n');
    }

    Icon coracao = Icon(Icons.favorite_border);
    if (ehFavorita(receita)) {
      coracao = Icon(Icons.favorite);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: coracao,
            onPressed: () => setState(() => alternarFavorito(receita)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                receita.imagem ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, erro, stack) => Icon(Icons.restaurant, size: 100, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16,),
            Text(receita.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(receita.tiposRefeicao.join(', ')),
            const SizedBox(height: 12,),
            Text(tempo),
            Text(porcoes),
            Text('Nota: ${receita.nota ?? 'sem avaliação'}'),
            const SizedBox(height: 20,),
            Text('Ingredientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(ingredientes),
            const SizedBox(height: 20,),
            Text('Modo de Preparo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(instrucoes),
            const SizedBox(height: 20,),
            OutlinedButton(
              child: const Text('Voltar'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}