import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarCustomState createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(56);

}

class _AppBarCustomState extends State<AppBarCustom> {
  bool _selectedMelhorAvaliacao = false;
  bool _selectedMaisRapido = false;
  bool _selectedMaisBarato = false;


  void _melhorAvaliacao(bool value) => setState(() => _selectedMelhorAvaliacao = value);
  void _maisRapido(bool value) => setState(() => _selectedMaisRapido = value);
  void _maisBarato(bool value) => setState(() => _selectedMaisBarato = value);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Escolha uma Revenda',
        style: TextStyle(fontSize: 19),
      ),
      actions: <Widget>[
        PopupMenuButton(
            icon: Icon(Icons.swap_vert),
            onSelected: (value) {
              print(value);
              if (value == 1) {
              } else if (value == 2) {
              } else if (value == 3) {}
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Melhor Avaliação'),
                      new Checkbox(
                        value: _selectedMelhorAvaliacao,
                        onChanged: _melhorAvaliacao, ),    
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais rápido'),
                      new Checkbox(
                        value: _selectedMaisRapido,
                        onChanged: _maisRapido,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais barato'),
                      new Checkbox(
                        value: _selectedMaisBarato,
                        onChanged: _maisBarato,
                      ),
                    ],
                  ),
                ),
              ];
            }),
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
    );
  }
}
