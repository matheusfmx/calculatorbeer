import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/teste.png',
          height: 190,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
