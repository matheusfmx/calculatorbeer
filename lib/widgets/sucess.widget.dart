import 'package:flutter/material.dart';
import 'package:me/widgets/loading-button.dart';

class Sucess extends StatelessWidget {
  var result = "";
  var result1 = "";

  Function reset;
  Sucess({
    @required this.result,
    @required this.result1,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
        bottom: 120,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text('Resultado:',style: TextStyle(
              color: Colors.green,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          Text('$result1',style: TextStyle(
              color: Colors.green,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
         
          SizedBox(
            height: 10,
          ),
          Text(
            '$result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          LoadingButton(
            busy: false,
            func: reset,
            text: 'CALCULAR NOVAMENTE',
            invert: true,
          ),
        ],
      ),
    );
  }
}
