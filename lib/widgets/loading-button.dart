import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function func;
  var text = '';

  LoadingButton({
    @required this.busy,
    @required this.func,
    @required this.invert,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 60,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
              left: 20,
            ),
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert ? Colors.green : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton(
              onPressed: func,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Big Shoulders Display',
                  color: invert ? Colors.white : Colors.green,
                ),
              ),
              
            ),
          );
  }
}
