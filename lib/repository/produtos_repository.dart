import 'dart:convert';

import 'package:desafiio_modulo9/models/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutosRepository {
  Future<List<ProdutosModel>> buscarProdutos() async {
    List<ProdutosModel> produtos = List<ProdutosModel>();
    try {
      return await rootBundle.loadString('assets/dados.json').then((jsonData) {
        var obj = jsonDecode(jsonData);
        for (var reg in obj) {
          var dados = ProdutosModel.fromMap(reg);
          produtos.add(dados);
        }
        return produtos;
      });
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
