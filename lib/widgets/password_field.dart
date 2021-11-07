import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget{

  const PasswordField({Key? key, required this.controller, required this.errorPasswordText}) : super(key: key);
  final TextEditingController controller;
  final String errorPasswordText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Пароль",
        labelText: "Пароль",
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Color.fromRGBO(102, 102, 102, 1),
          fontSize: 16,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        isCollapsed: true,
      ),
      validator: (value) {return errorPasswordText;},
    );
  }
}