import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_logi/widgets/email_field.dart';
import 'package:mobile_logi/widgets/password_field.dart';

import 'gradient_button.dart';

class LoginForm extends StatelessWidget{

  const LoginForm({Key? key, required this.controller, required this.errorEmailText,
    required this.errorPasswordText, required this.errorLogin, required this.onPressed}) : super(key: key);

  final TextEditingController controller;
  final String errorEmailText;
  final String errorPasswordText;
  final String errorLogin;
  final GestureTapCallback onPressed;


  @override
  Widget build(BuildContext context) {
    var _isRobot = false;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(250, 250, 250, 250),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Form(
        child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(height: 48,),
                Text.rich(
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Вход',
                        style: TextStyle(
                          color: Color.fromRGBO(67, 135, 122, 1),
                        ),
                      ),
                      TextSpan(text: ' в личный кабинет')
                    ],
                  ),
                  style: TextStyle(
                    fontFamily: GoogleFonts.romanesco().fontFamily,
                    color: Color.fromRGBO(64, 59, 94, 1),
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                EmailField(controller: controller, errorEmailText: errorEmailText),
                SizedBox(height: 20,),
                PasswordField(controller: controller, errorPasswordText: errorPasswordText),
                SizedBox(height: 10,),
                Text(
                  errorLogin,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(250, 0, 0, 1),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Checkbox(
                        value: _isRobot,
                        onChanged: (isValue){
                          _isRobot = isValue!;
                        }),
                    Text(
                      "Я не робот",
                      style: TextStyle(
                        color: Color.fromRGBO(158, 160, 165, 1),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                GradientButton(
                  onPressed: _isRobot ? onPressed : (){},
                  buttonText: 'Войти',
                ),
                SizedBox(height: 20,),
              ],
            )
        ),
      ),
    );
  }

}