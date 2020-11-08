import 'package:desafiio_modulo9/components/melhor_preco.dart';
import 'package:desafiio_modulo9/pages/pagamento_page.dart';
import 'package:flutter/material.dart';

import 'package:desafiio_modulo9/models/produtos_model.dart';

class CardFornecedor extends StatelessWidget {
  final List<ProdutosModel> produtos;
  final int index;
  const CardFornecedor({
    this.produtos,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          PagamentoPage.routerName,
          arguments: {
            new ProdutosModel(
              nome: produtos[index].nome,
              preco: produtos[index].preco,
              melhorPreco: produtos[index].melhorPreco,
              nota: produtos[index].nota,
              tempoMedio: produtos[index].tempoMedio,
              cor: produtos[index].cor,
              tipo: produtos[index].tipo,
            ),
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: RotatedBox(
                quarterTurns: -1,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(int.parse("0xFF" + produtos[index].cor)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      produtos[index].tipo,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(produtos[index].nome),
                          produtos[index].melhorPreco
                              ? MelhorPreco()
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Nota',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      produtos[index].nota.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Tempo Médio',
                              style:
                                  TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(produtos[index].tempoMedio,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'min',
                                      style: TextStyle(fontSize: 6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Preço',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  'R\$ ${produtos[index].preco.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
