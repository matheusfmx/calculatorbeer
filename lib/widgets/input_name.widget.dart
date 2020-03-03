import 'package:flutter/material.dart';

class InputName extends StatefulWidget {
  var name1ctrl = new TextEditingController();

  InputName({
    @required this.name1ctrl,
  });

  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
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
            controller: widget.name1ctrl,
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
              contentPadding: EdgeInsets.only(top: 20),
            ),
          ),
        ),
      ],
    );
  }
}
