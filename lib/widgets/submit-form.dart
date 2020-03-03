import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:me/widgets/input.widget.dart';
import 'package:me/widgets/input2.widget.dart';
import 'package:me/widgets/input_name.widget.dart';
import 'package:me/widgets/input_name2.widget.dart';

import 'package:me/widgets/loading-button.dart';

class SubmitForm extends StatelessWidget {
  var precoCtrl = new MoneyMaskedTextController();
  var precoCtrl1 = new MoneyMaskedTextController();
  var unitCtrl = new TextEditingController();
  var unitCtrl1 = new TextEditingController();
  var name1ctrl = new TextEditingController();
  var name2ctrl = new TextEditingController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.precoCtrl,
    @required this.precoCtrl1,
    @required this.unitCtrl,
    @required this.unitCtrl1,
    @required this.name1ctrl,
    @required this.name2ctrl,
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
          SizedBox(),
          InputName(
            name1ctrl: name1ctrl,
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
          InputName2(
            name2ctrl: name2ctrl,
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
