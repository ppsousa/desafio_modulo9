import 'package:flutter/material.dart';

class MarcaSelecionada extends StatelessWidget {
  final String marcaSelecionada;
  final String cor;
  const MarcaSelecionada({
    Key key,
    this.marcaSelecionada,
    this.cor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(
          int.parse("0xFF" + (cor == null ? "000000" : cor)),
        ),
      ),
      height: 30,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(marcaSelecionada??'não foi selecionado',
                  style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
