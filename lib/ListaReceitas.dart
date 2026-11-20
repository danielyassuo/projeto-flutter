import 'package:flutter/material.dart';
import 'package:untitled/DetalhesReceita.dart';


class ListaReceitas extends StatelessWidget {
  const ListaReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.restaurant, color: Colors.blue),
              title: Text('Nome da receita'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const DetalhesReceita(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
