import 'package:flutter/material.dart';

class CheckboxText extends StatelessWidget {
  const CheckboxText(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.text})
      : super(key: key);

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(158, 160, 165, 1),
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
