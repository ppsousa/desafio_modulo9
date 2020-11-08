import 'dart:ui';

import 'package:desafiio_modulo9/components/marca_selecionada.dart';
import 'package:desafiio_modulo9/models/produtos_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PagamentoPage extends StatefulWidget {
  static String routerName = '/pagamento';

  double _precoTotal = 0;

  final ProdutosModel produto;
  PagamentoPage({
    Key key,
    this.produto,
  }) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  int group = 0;
  int selectedStep = 0;
  int nbSteps = 3;

  int _qtde = 1;

  @override
  void initState() {
    this.widget._precoTotal = this.widget.produto.preco;
    super.initState();
  }

  void incremento() {
    setState(() {
      _qtde++;
      this.widget._precoTotal = this.widget.produto.preco * _qtde;
    });
  }

  void decremento() {
    if (_qtde <= 0) {
      this.widget._precoTotal = 0;
      return;
    }
    setState(() {
      _qtde--;
      this.widget._precoTotal = this.widget.produto.preco * _qtde;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Produtos'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Text(
                  '?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          height: 20,
                          width: 20,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 20)
                            ],
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            border: new Border.all(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                      Text("Comprar")
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 20,
                        width: 20,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Colors.blueGrey.shade200,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Text("Pagamento")
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 20,
                        width: 20,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Colors.blueGrey.shade200,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Text("Confirmação")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Divider(
                color: Colors.black,
                height: 20,
              ),
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        color: Color(
                          int.parse("0xFF" +
                              (this.widget.produto.cor == null
                                  ? "000000"
                                  : this.widget.produto.cor)),
                        ),
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        this.widget.produto.nome == null
                            ? 'fornecedor - Botijão de 13kg'
                            : '${this.widget.produto.nome} - Botijão de 13kg', style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 9,
                              right: 6,
                            ),
                            child: Text(
                              'R\$',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Text(
                             this.widget._precoTotal.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Icon(
                                    Icons.home,
                                    size: 35,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 5),
                                      child: Text(
                                          this.widget.produto.nome == null
                                              ? 'fornecedor'
                                              : this.widget.produto.nome),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            this.widget.produto.nota == null
                                                ? '0.0'
                                                : this
                                                    .widget
                                                    .produto
                                                    .nota
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50.0),
                                          child: Text(this
                                                      .widget
                                                      .produto
                                                      .tempoMedio ==
                                                  null
                                              ? '0~0'
                                              : this.widget.produto.tempoMedio),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            'min',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: MarcaSelecionada(
                                    marcaSelecionada: this.widget.produto.tipo,
                                    cor: this.widget.produto.cor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Divider(
                                color: Colors.grey[300],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text("Botijão de 13kg"),
                                        Text(this.widget.produto.nome == null
                                            ? 'fornecedor'
                                            : this.widget.produto.nome),
                                        Text(
                                          'R\$ ' +
                                              (this.widget.produto.preco == null
                                                  ? 0.00.toStringAsFixed(2)
                                                  : this
                                                      .widget
                                                      .produto
                                                      .preco
                                                      .toStringAsFixed(2)),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            decremento();
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              color: Colors.grey,
                                              height: 30,
                                              width: 30,
                                              child: Center(
                                                  child: Text(
                                                "-",
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/gas.png'),
                                                color: Colors.green,
                                              ),
                                            ),
                                            ClipOval(
                                              child: Container(
                                                color: Colors.orange,
                                                height: 30,
                                                width: 20,
                                                child: Center(
                                                    child: Text(
                                                  "$_qtde",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            incremento();
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              color: Colors.grey,
                                              height: 30,
                                              width: 30,
                                              child: Center(
                                                  child: Text(
                                                "+",
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 50, right: 50),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.blue[300], Colors.blue]),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10, offset: Offset(0, 5))
                                ]),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'IR PARA O PAGAMENTO',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
