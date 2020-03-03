import 'package:flutter/material.dart';

class InputName2 extends StatefulWidget {
  var name2ctrl = new TextEditingController();

  InputName2({
    @required this.name2ctrl,
  });

  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 80,
        ),
        Container(
          width: 210,
          alignment: Alignment.centerRight,
          child: TextField(
            textAlign: TextAlign.center,
            controller: widget.name2ctrl,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              hintText: 'Preencha o campo',
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              contentPadding: EdgeInsets.only(top: 1),
            ),
          ),
        ),
      ],
    );
  }
}
