import 'package:flutter/material.dart';
import 'package:mobile_logi/viewmodels/impl/form_view_model_impl.dart';

class PasswordField extends StatefulWidget {

  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordField();

}

class _PasswordField extends State<PasswordField> {

  TextEditingController controllerPassword = TextEditingController();
  FormViewModelImpl _viewModel = FormViewModelImpl();

  @override
  void dispose() {
    if (_viewModel.outputErrorLogin.last as bool) {
      _viewModel.inputPasswordText.close();
      controllerPassword.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    controllerPassword.addListener(
        () => _viewModel.inputPasswordText.add(controllerPassword.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<String>(
        stream: _viewModel.outputErrorPasswordText,
        builder: (context, snapshot) {
          debugPrint("password ${snapshot.data}");
          return TextFormField(
            controller: controllerPassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Пароль",
              labelText: "Пароль",
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontSize: 16,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              isCollapsed: true,
              errorText: snapshot.data == "" ? null : snapshot.data,
            ),
            onChanged: (value) {
              _viewModel.password = value;
            },
          );
        });
  }
}
