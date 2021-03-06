import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:me/widgets/logo.widget.dart';
import 'package:me/widgets/submit-form.dart';
import 'package:me/widgets/sucess.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _precoCtrl = new MoneyMaskedTextController();
  var _precoCtrl1 = new MoneyMaskedTextController();
  var _unitCtrl = new TextEditingController();
  var _unitCtrl1 = new TextEditingController();
  var name1ctrl = new TextEditingController();
  var name2ctrl = new TextEditingController();

  var _busy = false;
  var _completed = false;
  var _resultText = '';
  var _resultText1 = '';

  double difvalor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Sucess(
                  result: _resultText,
                  result1: _resultText1,
                  reset: reset,
                )
              : SubmitForm(
                  precoCtrl: _precoCtrl,
                  precoCtrl1: _precoCtrl1,
                  unitCtrl: _unitCtrl,
                  unitCtrl1: _unitCtrl1,
                  name1ctrl: name1ctrl,
                  name2ctrl: name2ctrl,
                  submitFunc: calculate,
                  busy: _busy,
                )
        ],
      ),
    );
  }

  Future calculate() {
    var totp1 = double.parse(_precoCtrl.text.replaceAll(
          new RegExp(r'[,.]'),
          '',
        )) *
        12;
    var totp2 = double.parse(_precoCtrl1.text.replaceAll(
          new RegExp(r'[,.]'),
          '',
        )) *
        12;
    var totmlp1 = double.parse(_unitCtrl.text.replaceAll(
          new RegExp(r'[,.]'),
          '',
        )) *
        12;
    var totmlp2 = double.parse(_unitCtrl1.text.replaceAll(
          new RegExp(r'[,.]'),
          '',
        )) *
        12;
    var latas = 0.0;
    var litros = 0.0;
    var totlitros = 0.0.abs();
    var diflitros = 0.0.abs();
    double total = 0;
    var precounit1 = int.parse(_precoCtrl.text.replaceAll(
      new RegExp(r'[,.]'),
      '',
    ));
    var precounit2 = int.parse(_precoCtrl1.text.replaceAll(
      new RegExp(r'[,.]'),
      '',
    ));
    var precoml1 = int.parse(_unitCtrl.text.replaceAll(
      new RegExp(r'[,.]'),
      '',
    ));
    var precoml2 = int.parse(
      _unitCtrl1.text.replaceAll(
        new RegExp(r'[,.]'),
        '',
      ),
    );

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(
        () {
          if (totp1 > totp2) {
            difvalor = totp1 - totp2;

            latas = difvalor / precounit2;

            litros = latas.roundToDouble() * precoml2;

            totlitros = litros + totmlp2;

            diflitros = totlitros - totmlp1;

            total = latas + 12;

            if (diflitros > 0) {
              _resultText1 = 'Cerveja 2';

              _resultText = ('Comprando ' +
                  total.toStringAsFixed(0) +
                  ' unidades da Cerveja 2 sairá o mesmo preço que a Cerveja 1. Porém levando a Cerveja 2 você ganhará ' +
                  diflitros.toStringAsFixed(0) +
                  ' ml a mais!');
            } else if (diflitros < 0) {
              _resultText1 = 'Cerveja 2';

              _resultText =
                  'Pelo mesmo preço das duas cervejas, você ganhará ' +
                      diflitros.abs().toStringAsFixed(0) +
                      ' ml a mais levando a Cerveja 2!';
            } else if (diflitros == 0) {
              _resultText1 = 'Cerveja 2';

              _resultText = 'Levando ' +
                  total.toStringAsFixed(0) +
                  ' da Cerveja 2, fica o mesmo preço que levar a Cerveja 1 e não há nenhuma diferença de ML';
            }
          } else {
            difvalor = (totp2 - totp1);

            latas = (difvalor / precounit1);

            litros = latas.roundToDouble() * precoml1;

            totlitros = litros + totmlp1;

            diflitros = totlitros - totmlp2;
          }

          total = latas + 12;

          if (diflitros > 0) {
            _resultText1 = 'Cerveja 1';

            _resultText = ('Comprando ' +
                total.toStringAsFixed(0) +
                ' unidades da Cerveja 1 sairá o mesmo preço que a Cerveja 2. Porém levando a Cerveja 1 você ganhará ' +
                diflitros.abs().toStringAsFixed(0) +
                ' ml a mais!');
          } else if (diflitros < 0) {
            _resultText1 = 'Cerveja 1';
            _resultText = 'Pelo mesmo preço das duas cervejas, você ganhará ' +
                diflitros.abs().toStringAsFixed(0) +
                ' ml a mais levando a Cerveja 1!';
          } else if (diflitros == 0) {
            _resultText1 = 'Cerveja 1';

            _resultText = 'Levando ' +
                total.abs().toStringAsFixed(0) +
                ' da Cerveja 1, fica o mesmo preço que levar a Cerveja 2 e não há nenhuma diferença de ML';
          }

          _busy = false;

          _completed = true;
        },
      );
    });
  }

  reset() {
    setState(() {
      _precoCtrl = new MoneyMaskedTextController();
      _precoCtrl1 = new MoneyMaskedTextController();
      _unitCtrl = new TextEditingController();
      _unitCtrl1 = new TextEditingController();
      _completed = false;
      _busy = false;
    });
  }
}
