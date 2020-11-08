import 'package:desafiio_modulo9/models/produtos_model.dart';
import 'package:desafiio_modulo9/pages/pagamento_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: (settings) {
        dynamic page;
        switch (settings.name) {
          case '/home':
            page = HomePage();
            break;
          case '/pagamento':
            ProdutosModel produto = ProdutosModel();
            for (var prod in settings.arguments) {
              produto.nome = prod.nome;
              produto.cor = prod.cor;
              produto.preco = prod.preco;
              produto.melhorPreco = prod.melhorPreco;
              produto.nota = prod.nota;
              produto.tipo = prod.tipo;
              produto.tempoMedio = prod.tempoMedio;
            }
            page = PagamentoPage(
              produto: produto,
            );
            break;
        }

        return MaterialPageRoute(builder: (_) => page);
      },
      // routes: {
      //   //This is what you are missing i guess
      //   "/home": (context) => HomePage(),
      //   "/pagamento": (context) => PagamentoPage(),
      // },
    );
  }
}
