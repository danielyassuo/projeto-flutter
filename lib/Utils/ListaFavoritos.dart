import 'package:untitled/Receita.dart';


final List<Receita> favoritos = [];

bool ehFavorita(Receita receita) {
  for (final item in favoritos) {
    if (item.id == receita.id) return true;
  }
  return false;
}

void alternarFavorito(Receita receita) {
  if (ehFavorita(receita)) {
    favoritos.removeWhere((item) => item.id == receita.id);
  } else {
    favoritos.add(receita);
  }
}