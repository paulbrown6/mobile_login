import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {

  const Toolbar(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                BackButton(
                  color: Color.fromARGB(250, 250, 250, 250),
                ),
                Text(
                  "Назад",
                  style: TextStyle(
                    color: Color.fromARGB(250, 250, 250, 250),
                  ),
                ),
              ],
            )),
        Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 20),
            child: Image.asset('assets/images/logo_euroskills.png',
                width: 100, height: 100)),
      ],
    );
  }
}