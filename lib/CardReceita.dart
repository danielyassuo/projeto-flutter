import 'package:flutter/material.dart';
import 'package:untitled/DetalhesReceita.dart';
import 'package:untitled/Receita.dart';

class CardReceita extends StatelessWidget {
  const CardReceita({super.key, required this.receita});
  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 60,
          height: 60,
          child: Image.network(
            receita.imagem ?? '',
            fit: BoxFit.cover,
            // Se a imagem não existir ou falhar, mostra um ícone
            errorBuilder: (context, erro, stack) => Icon(Icons.restaurant, color: Colors.blue),
          ),
        ),
        title: Text(receita.nome),
        subtitle: Text('Nota: ${receita.nota ?? 'sem avaliação'}'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => DetalhesReceita(receita: receita),
          ));
        },
      ),
    );
  }
}