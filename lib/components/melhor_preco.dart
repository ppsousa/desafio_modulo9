import 'package:flutter/material.dart';

class MelhorPreco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      height: 30,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.label,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text('Melhor Preço',
                  style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
