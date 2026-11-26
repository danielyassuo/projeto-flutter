import 'package:flutter/material.dart';
import 'package:untitled/DetalhesReceita.dart';
import 'package:untitled/Utils/ListaFavoritos.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({super.key});
  @override
  State<Favoritos> createState() => _FavoritosState();
}
class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    if (favoritos.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favoritos'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border, size: 60, color: Colors.blue),
              const SizedBox(height: 12,),
              const Text('Nenhum favorito'),
              const Text('Marque uma receita como favorita para encontrá-la aqui.'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(favoritos[i].nome),
          subtitle: const Text('Toque no coração para remover'),
          trailing: IconButton(
            icon: Icon(Icons.favorite, color: Colors.blue),
            onPressed: () => setState(() => alternarFavorito(favoritos[i])),
          ),
          onTap: () async {
            await Navigator.push(context, MaterialPageRoute(
              builder: (_) => DetalhesReceita(receita: favoritos[i]),
            ));
            // Ao voltar, atualiza a lista (pode ter removido nos detalhes)
            setState(() {});
          },
        ),
      ),
    );
  }
}