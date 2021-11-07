import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{

  const GradientButton({Key? key, required this.onPressed, required this.buttonText}) : super(key: key);
  final GestureTapCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    const _myGradient = LinearGradient(
        begin : Alignment.centerLeft,
        end : Alignment.topRight,
        colors : [ Color(0xFF403B5E), Color(0xFFAA5A6B) ],
        tileMode : TileMode.repeated
    );

    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      onPressed: onPressed,
      child: Ink(
        decoration: const BoxDecoration(
          gradient: _myGradient,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 56.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 1)
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}