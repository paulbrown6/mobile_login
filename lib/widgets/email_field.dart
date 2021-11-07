import 'package:flutter/material.dart';
import 'package:mobile_logi/viewmodels/impl/form_view_model_impl.dart';

class EmailField extends StatelessWidget{

  const EmailField({Key? key, required this.controller,
    required this.errorEmailText}) : super(key: key);
  final TextEditingController controller;
  final String errorEmailText;

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder(
          builder: (context, data){
            return TextFormField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Логин",
                labelText: "Логин",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontSize: 16,
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                isCollapsed: true,
              ),
              validator: (value){return errorEmailText;},
            );
          }
      );
  }
}