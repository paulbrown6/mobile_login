import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BicolorText extends StatelessWidget {

  const BicolorText(
      {Key? key,
      required this.textOne,
      required this.textTwo,
      required this.colorOne,
      required this.colorTwo})
      : super(key: key);

  final String textOne;
  final String textTwo;
  final Color colorOne;
  final Color colorTwo;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: textOne,
            style: TextStyle(
              color: colorOne,
            ),
          ),
          TextSpan(
              text: textTwo
          ),
        ],
      ),
      style: TextStyle(
        fontFamily: GoogleFonts.romanesco().fontFamily,
        color: colorTwo,
        fontSize: 26,
      ),
      textAlign: TextAlign.center,
    );
  }
}
