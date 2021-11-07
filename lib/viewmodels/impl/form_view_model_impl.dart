import 'dart:async';
import 'package:dio_http/dio_http.dart';
import 'package:mobile_logi/retrofit/api.dart';
import 'package:mobile_logi/validator/text_field_validator.dart';
import 'package:mobile_logi/viewmodels/form_view_model.dart';

class FormViewModelImpl extends FormViewModel{

  var _emailTextController = StreamController<String>.broadcast();
  var _passwordTextController = StreamController<String>.broadcast();

  @override
  void dispose() {
    _emailTextController.close();
    _passwordTextController.close();
  }

  @override
  Sink get inputEmailText => _emailTextController;

  @override
  Sink get inputPasswordText => _passwordTextController;

  @override
  Stream<bool> get outputError => _emailTextController.stream.map
    ((email) => EmailValidator(email).isValid) ;

  @override
  Stream<String> get outputErrorEmailText => outputError.
    map((event) => event ? "": "Некорректный email");

  @override
  Stream<String> get outputErrorPasswordText => outputError.
    map((event) => event ? "": "Пароль должен иметь больше 8 символов");

  Future<bool> login(String login, String password) async {
    if (!EmailValidator(login).isValid || !PasswordValidator(password).isValid){
      return false;
    }
    try {
      final dio = Dio();
      dio.options.headers["Content-Type"] = "application/json";
      final client = RestClient(dio);
      client.signin({"username": login, "password": password}).then((response) {
        if (response != null && response.accessToken != null) {
          print(response.accessToken);
          return true;
        } else {
          return false;
        }
      });
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}