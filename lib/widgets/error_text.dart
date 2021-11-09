import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {

  const ErrorText(
      {Key? key,
        required this.text})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromRGBO(250, 0, 0, 1),
        fontSize: 16,
      ),
    );
  }
}