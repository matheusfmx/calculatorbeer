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

  var _busy = false;
  var _completed = false;
  var _resultText = '';
  var _resultText1 = '';

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
                  submitFunc: calculate,
                  busy: _busy,
                )
        ],
      ),
    );
  }

  Future calculate() {
    var totp1 =  double.parse(_precoCtrl.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12;
    var totp2 = double.parse(_precoCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',))* 12;
    var totmlp1 = double.parse(_unitCtrl.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12;
    var totmlp2 = double.parse(_unitCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12;
    var difvalor = 0.0;
    var latas = 0.0;
    var litros = 0.0;
    var totlitros = 0.0;
    var diflitros = 0.0;
    var precounit1 = int.parse(_precoCtrl.text.replaceAll(new RegExp(r'[,.]'), '',));
    var precounit2 = int.parse(_precoCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',));
    var precoml1 = int.parse(_unitCtrl.text.replaceAll(new RegExp(r'[,.]'), '',));
    var precoml2 = int.parse(_unitCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',));

    //totp1 = double.parse(_precoCtrl.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12 as int;
    //totp2 = double.parse(_precoCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',))* 12 as int;
    //totmlp1 = double.parse(_unitCtrl.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12 as int;
    //totmlp2 = double.parse(_unitCtrl1.text.replaceAll(new RegExp(r'[,.]'), '',)) * 12 as int;

    

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), ()  {
      setState(
        () {
          if (totp1 > totp2) {
            difvalor = totp1 - totp2;
            latas = difvalor / precounit2;
            litros = latas * precoml2;
            totlitros = litros + totmlp2;
            diflitros = totlitros - totmlp1;
            
            if (diflitros > 0) {
            _resultText1 = 'Produto 2';
            _resultText =
                ('Comprando mais '+ latas.toStringAsFixed(0) +
                        ' unidades do Produto 2, sairá o mesmo preço que o Produto 1. Porém levando o Produto 2 você vai ganhar ' +
                   diflitros.toStringAsFixed(0) +
                    ' ml a mais!');
          } else if (diflitros < 0)
            _resultText = 'Pelo mesmo preço você leva ' + latas.toStringAsFixed(0)+
                ' unidades do Produto 1. Porém levando o Produto 2, você ganhará '+diflitros.toStringAsFixed(0)+' ml a mais!';
          else if (diflitros == 0) {
          _resultText1 = 'Produto 2';
            _resultText =
                'Levando '+ latas.toStringAsFixed(0)+' do Produto 2, fica o mesmo preço que levar a Produto 1 e não há nenhuma diferença de ML';
          }

          } else {
            difvalor = (totp2 - totp1);
            latas = (difvalor / precounit1);
            litros = latas * precoml1;
            totlitros = litros + totmlp1;
            diflitros = totlitros - totmlp2;
          }

            if (diflitros > 0) {
          _resultText =
                ('Comprando mais '+ latas.toStringAsFixed(0) +
                        ' unidades do Produto 1, sairá o mesmo preço que o Produto 2. Porém levando o Produto 1 você vai ganhar ' +
                    diflitros.toStringAsFixed(0) +
                    ' ml a mais!');
          } else if (diflitros < 0)
            _resultText = 'Pelo mesmo preço você leva ' + latas.toStringAsFixed(0)+
                ' unidades do Produto 2. Porém levando o Produto 1, você ganhará '+diflitros.toStringAsFixed(0)+' ml a mais!';
          else if (diflitros == 0) {
            _resultText =
                'Levando '+ latas.toStringAsFixed(0)+' unidades do Produto 1, fica o mesmo preço que levar o Produto 2 e não há nenhuma diferença de ML';
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
