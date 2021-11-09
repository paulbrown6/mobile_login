import 'dart:async';
import 'package:dio_http/dio_http.dart';
import 'package:flutter/material.dart';
import 'package:mobile_logi/retrofit/api.dart';
import 'package:mobile_logi/validator/text_field_validator.dart';
import 'package:mobile_logi/viewmodels/form_view_model.dart';

class FormViewModelImpl extends FormViewModel{

  static final FormViewModelImpl instance = FormViewModelImpl.internal();

  FormViewModelImpl.internal();

  factory FormViewModelImpl() {
    return instance;
  }

  final LoginData loginData = LoginData();

  final _emailTextController = StreamController<String>.broadcast();

  final _passwordTextController = StreamController<String>.broadcast();

  final _loginController = StreamController<bool>.broadcast();

  @override
  Sink get inputEmailText => _emailTextController;

  @override
  Sink get inputPasswordText => _passwordTextController;

  @override
  Stream<bool> get outputErrorEmail => _emailTextController.stream.map
    ((value) => EmailValidator(value).isValid);

  @override
  Stream<bool> get outputErrorPassword => _passwordTextController.stream.map
    ((value) => PasswordValidator(value).isValid);

  Stream<bool> get outputErrorLogin => _loginController.stream.map
    ((event) => event);

  @override
  Stream<String> get outputErrorEmailText => outputErrorEmail.
    map((value) => value ? "": "Некорректный email");

  @override
  Stream<String> get outputErrorPasswordText => outputErrorPassword.
    map((value) => value ? "": "Пароль должен иметь больше 7 символов");

  Stream<String> get outputErrorLoginText => outputErrorLogin.
    map((value) => value ? "": "Неправильный логин или пароль");

  set email(String value) => loginData.login = value;

  set password(String value) => loginData.password = value;

  Future<bool> login() async {
    bool event = false;
    String login = loginData.login;
    String password = loginData.password;
    debugPrint("login is Start! login = $login || password = $password");
    if (login.isNotEmpty && password.isNotEmpty){
      try {
        final dio = Dio();
        dio.options.headers["Content-Type"] = "application/json";
        final client = RestClient(dio);
        client.signin({"username": login, "password": password}).then((
            response) {
          if (response != null) {
            debugPrint(response.accessToken);
            event = true;
          }
          _loginController.add(event);
          debugPrint("event = $event");
          if (event) _loginController.close();
        });
        _loginController.add(event);
        debugPrint("event = $event");
      } catch (e) {
        debugPrint(e.toString());
        _loginController.add(event);
        debugPrint("event = $event");
      }
    } else {
      _loginController.add(event);
      debugPrint("event = $event");
    }
    return false;
  }
}

class LoginData {
  String login = "";
  String password = "";
}