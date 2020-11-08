import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Regiao extends StatelessWidget {
  final double appBarHeight;

  const Regiao({this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidthDp,
      height: (ScreenUtil.screenHeightDp -
              appBarHeight -
              ScreenUtil.statusBarHeight) *
          .13,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Botijões de 13kg em:',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Av Paulista, 1001',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Paulista, São Paulo, SP',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, right: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: InkWell(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: Text(
                        'Mudar',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
