import 'package:flutter/material.dart';
import 'package:mobile_logi/viewmodels/impl/form_view_model_impl.dart';

class EmailField extends StatefulWidget{

  const EmailField({Key? key}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailField();

}

class _EmailField extends State<EmailField>{

  TextEditingController controllerEmail = TextEditingController();
  FormViewModelImpl _viewModel = FormViewModelImpl();

  @override
  void dispose() {
    if (_viewModel.outputErrorLogin.last as bool) {
      _viewModel.inputEmailText.close();
      controllerEmail.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    controllerEmail.addListener(
            () => _viewModel.inputEmailText.add(controllerEmail.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<String>(
          stream: _viewModel.outputErrorEmailText,
          builder: (context, snapshot){
            debugPrint(snapshot.data);
            return TextFormField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Логин",
                labelText: "Логин",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontSize: 16,
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                isCollapsed: true,
                errorText: snapshot.data == "" ? null : snapshot.data,
              ),
              onChanged: (value) {
                debugPrint(value);
                _viewModel.email = value;
              },
            );
          }
      );
  }

}