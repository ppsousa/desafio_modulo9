import 'dart:convert';

class ProdutosModel {
  String tipo;
  String nome;
  String cor;
  double nota;
  String tempoMedio;
  bool melhorPreco;
  double preco;
  ProdutosModel({
    this.tipo,
    this.nome,
    this.cor,
    this.nota,
    this.tempoMedio,
    this.melhorPreco,
    this.preco,
  });
  


  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'cor': cor,
      'nota': nota,
      'tempoMedio': tempoMedio,
      'melhorPreco': melhorPreco,
      'preco': preco,
    };
  }

  factory ProdutosModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ProdutosModel(
      tipo: map['tipo'],
      nome: map['nome'],
      cor: map['cor'],
      nota: map['nota'],
      tempoMedio: map['tempoMedio'],
      melhorPreco: map['melhorPreco'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) => ProdutosModel.fromMap(json.decode(source));
}
