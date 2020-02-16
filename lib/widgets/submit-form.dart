import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:me/widgets/input.widget.dart';
import 'package:me/widgets/input2.widget.dart';
import 'package:me/widgets/loading-button.dart';

class SubmitForm extends StatelessWidget {
  var precoCtrl = new MoneyMaskedTextController();
  var precoCtrl1 = new MoneyMaskedTextController();
  var unitCtrl = new TextEditingController();
  var unitCtrl1 = new TextEditingController();
  var busy = false;
  Function submitFunc;
  
  SubmitForm({
    @required this.precoCtrl,
    @required this.precoCtrl1,
    @required this.unitCtrl,
    @required this.unitCtrl1,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        // set border width
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            'Unidade 1',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Input(
              label: 'Preço Unitário',
              ctrl: precoCtrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Input2(
              label: 'Unidade (ml)',
              ctrl1: unitCtrl,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Unidade 2',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Input(
              label: 'Preço Unitário',
              ctrl: precoCtrl1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Input2(
              label: 'Unidade (ml)',
              ctrl1: unitCtrl1,
            ),
          ),
          LoadingButton(
            busy: busy,
            func: submitFunc,
            text: 'CALCULAR',
            invert: false,
          ),
        ],
      ),
    );
  }
}
