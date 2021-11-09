import 'package:flutter/material.dart';
import 'package:mobile_logi/viewmodels/impl/form_view_model_impl.dart';
import 'package:mobile_logi/widgets/bicolor_text.dart';
import 'package:mobile_logi/widgets/checkbox_text.dart';
import 'package:mobile_logi/widgets/email_field.dart';
import 'package:mobile_logi/widgets/error_text.dart';
import 'package:mobile_logi/widgets/password_field.dart';

import 'gradient_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState();

  FormViewModelImpl _viewModel = FormViewModelImpl();

  var _isRobot = false;

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 48,
                ),
                BicolorText(
                    textOne: 'Вход',
                    textTwo: ' в личный кабинет',
                    colorOne: Color.fromRGBO(67, 135, 122, 1),
                    colorTwo: Color.fromRGBO(64, 59, 94, 1)),
                SizedBox(
                  height: 30,
                ),
                EmailField(),
                SizedBox(
                  height: 20,
                ),
                PasswordField(),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: _viewModel.outputErrorLoginText,
                    builder: (context, snapshot) {
                      if (snapshot.data != null && snapshot.data != "") {
                        return Column(
                          children: [
                            ErrorText(
                              text: '${snapshot.data}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: 10,
                        );
                      }
                    }),
                CheckboxText(
                  value: _isRobot,
                  onChanged: (value) {
                    setState(() {
                      _isRobot = value!;
                    });
                  },
                  text: "Я не робот",
                ),
                SizedBox(
                  height: 20,
                ),
                GradientButton(
                  onPressed: () {
                    _isRobot ? _viewModel.login() : null;
                    },
                  buttonText: 'Войти',
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
