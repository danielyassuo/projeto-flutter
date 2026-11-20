import 'package:flutter/material.dart';

class DetalhesReceita extends StatelessWidget {
  const DetalhesReceita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.restaurant, size: 100, color: Colors.blue)),
            SizedBox(height: 20),
            Text('Ingredientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Os ingredientes aparecerão aqui.'),
            SizedBox(height: 20),
            Text('Modo de Preparo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('O modo de preparo aparecerá aqui.'),
            SizedBox(height: 20),
            OutlinedButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}