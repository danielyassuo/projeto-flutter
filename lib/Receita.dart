class Receita{

  const Receita(this.id, this.nome, this.imagem, this.ingredientes, this.instrucoes,
      this.tempoPreparo, this.tempoCozimento, this.porcoes, this.nota, this.tiposRefeicao);

  final int id;
  final String nome;

  final String? imagem;
  final List<String> ingredientes;
  final List<String> instrucoes;
  final int? tempoPreparo;
  final int? tempoCozimento;
  final int? porcoes;
  final num? nota;
  final List<String> tiposRefeicao;


  int? get tempoTotal {
    if (tempoPreparo == null || tempoCozimento == null) return null;
    return tempoPreparo! + tempoCozimento!;
  }

  factory Receita.fromJson(Map<String, dynamic> json){
    final id = json['id'];
    if (id is! int){
      throw const FormatException('Receita Inválida');
    }

    final nome = json['name'];
    final imagem = json['image'];
    final preparo = json['prepTimeMinutes'];
    final cozimento = json['cookTimeMinutes'];
    final porcoes = json['servings'];
    final nota = json['rating'];

    return Receita(
      id,
      nome is String ? nome : 'Receita sem nome',
      imagem is String ? imagem : null,
      lerLista(json['ingredients']),
      lerLista(json['instructions']),
      preparo is int ? preparo : null,
      cozimento is int ? cozimento : null,
      porcoes is int ? porcoes : null,
      nota is num ? nota : null,
      lerLista(json['mealType']),
    );
  }

  // Transforma o valor da API em lista de texto (ou lista vazia se não vier)
  static List<String> lerLista(dynamic valor){
    if (valor is! List) return [];
    return valor.map((item) => item.toString()).toList();
  }
}