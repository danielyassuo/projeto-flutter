import 'package:flutter/material.dart';
import 'package:untitled/CardReceita.dart';
import 'package:untitled/Receita.dart';
import 'package:untitled/Utils/Request.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({super.key});

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  late Future<List<Receita>> receitas;

  @override
  void initState(){
    super.initState();

    receitas = receitasIniciais ?? carregarReceitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: receitas,
          builder: (context, estado) {
            if(estado.connectionState != ConnectionState.done){
              return const Center(child: CircularProgressIndicator(),);
            }

            if(estado.hasError){
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Não foi possível carregar as receitas.'),
                    const Text('Verifique sua conexão e tente novamente.'),
                    FilledButton(
                        onPressed: () => setState(() => receitas = carregarReceitas()),
                        child: const Text('Tentar Novamente')
                    )
                  ],
                ),
              );
            }

            final itens = estado.data ?? <Receita> [];
            if (itens.isEmpty){
              return const Center(child: Text('Nenhuma receita disponível'),);
            }

            return ListView.builder(
              itemCount: itens.length,
              itemBuilder: (_, i) => CardReceita(receita: itens[i]),
            );
          }
      ),
    );
  }
}