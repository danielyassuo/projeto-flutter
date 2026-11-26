import 'dart:convert';

import 'package:untitled/Receita.dart';
import 'package:http/http.dart' as http;

Future<List<Receita>>? receitasIniciais;

Future<List<Receita>> carregarReceitas() async {
  final resposta = await http.get(Uri.https(
    'dummyjson.com', '/recipes',
  )).timeout(const Duration(seconds: 10));

  return lerResposta(resposta);
}

Future<List<Receita>> pesquisarReceitas(String termo) async {
  final resposta = await http.get(Uri.https(
    'dummyjson.com', '/recipes/search', {'q': termo},
  )).timeout(const Duration(seconds: 10));

  return lerResposta(resposta);
}

List<Receita> lerResposta(http.Response resposta) {
  if(resposta.statusCode != 200){
    throw Exception('HTTP ${resposta.statusCode}');
  }

  final dados = jsonDecode(resposta.body);

  if (dados is! Map<String, dynamic>) throw const FormatException('Formato Invalido');

  final lista = dados['recipes'];
  if (lista is! List) throw const FormatException('Formato Invalido');

  return lista.map((item){
    if(item is! Map<String, dynamic>){
      throw const FormatException('Objeto Invalido');
    }
    return Receita.fromJson(item);
  }).toList();
}