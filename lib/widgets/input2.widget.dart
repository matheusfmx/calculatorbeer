import 'package:flutter/material.dart';

class Input2 extends StatelessWidget {
  var label = '';
  var ctrl1 = new TextEditingController();

  Input2({
    @required this.label,
    @required this.ctrl1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Big Shoulders Display'),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: ctrl1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'Big Shoulders Display',
            ),
            decoration: InputDecoration(
              hintText: '000',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
