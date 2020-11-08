import 'package:desafiio_modulo9/components/appBar_custom.dart';
import 'package:desafiio_modulo9/components/card_fornecedor.dart';
import 'package:desafiio_modulo9/components/regiao.dart';
import 'package:desafiio_modulo9/models/produtos_model.dart';
import 'package:desafiio_modulo9/repository/produtos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProdutosModel> produtos = List<ProdutosModel>();

  getProdutos() {
    ProdutosRepository().buscarProdutos().then((value) {
      setState(() {
        if (value != null) value.forEach((item) => produtos.add(item));
        print('Total de produtos: ${produtos?.length}');
      });
    });
  }

  _HomePageState() {
    getProdutos();
  }

  final appBar = AppBarCustom();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Regiao(appBarHeight: appBar.preferredSize.height),
            Container(
              height: (ScreenUtil.screenHeightDp -
                      appBar.preferredSize.height -
                      ScreenUtil.statusBarHeight) *
                  .87,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: produtos?.length,
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: CardFornecedor(
                          produtos: produtos,
                          index: index,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
