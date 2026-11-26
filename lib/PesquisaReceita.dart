import 'package:flutter/material.dart';
import 'package:untitled/CardReceita.dart';
import 'package:untitled/Receita.dart';
import 'package:untitled/Utils/Request.dart';

class Pesquisareceita extends StatefulWidget {
  const Pesquisareceita({super.key});

  @override
  State<Pesquisareceita> createState() => _PesquisareceitaState();
}

class _PesquisareceitaState extends State<Pesquisareceita> {
  final campo = TextEditingController();
  String ? erro;
  String termo = '';

  Future<List<Receita>>? pesquisa;

  void pesquisar() {
    String texto = campo.text.trim();
    setState(() {
      if(texto.isEmpty){
        erro = 'Digite o nome de uma receita';
        pesquisa = null;
      }else {
        erro = null;
        termo = texto;
        pesquisa = pesquisarReceitas(texto);
      }
    });
  }

  void limpar() {
    campo.clear();
    setState(() {
      erro = null;
      pesquisa = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar Receitas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
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
            OutlinedButton(onPressed: limpar, child: const Text('Limpar pesquisa')),
            const SizedBox(height: 16,),
            Expanded(child: resultado()),
          ],
        ),
      ),
    );
  }

  Widget resultado() {
    if (pesquisa == null) {
      return const SizedBox();
    }

    return FutureBuilder(
        future: pesquisa,
        builder: (context, estado) {
          if(estado.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(estado.hasError){
            return Column(
              children: [
                const Text('Não foi possível pesquisar. Verifique sua conexão.'),
                FilledButton(
                    onPressed: () => setState(() => pesquisa = pesquisarReceitas(termo)),
                    child: const Text('Tentar Novamente')
                )
              ],
            );
          }

          final itens = estado.data ?? <Receita> [];
          if (itens.isEmpty){
            return Text('Nenhum resultado para "$termo". Tente outro termo.');
          }

          return Column(
            children: [
              Text('Resultados para "$termo"'),
              Expanded(
                child: ListView.builder(
                  itemCount: itens.length,
                  itemBuilder: (_, i) => CardReceita(receita: itens[i]),
                ),
              ),
            ],
          );
        }
    );
  }
}