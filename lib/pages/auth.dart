import 'package:dio_http/dio_http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_logi/retrofit/api.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPage();
}


class LoginData {
  String login = "";
  String password = "";
}

class _AuthPage extends State{

  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool _isRobot = false;
  static bool _isLogin = false;

  static const _myGradient = LinearGradient(
      begin : Alignment.centerLeft,
      end : Alignment.topRight,
      colors : [ Color(0xFF403B5E), Color(0xFFAA5A6B) ],
      tileMode : TileMode.repeated
  );

  void login(String login, String password) async {
    try {
      final dio = Dio();   // Provide a dio instance
      dio.options.headers["Content-Type"] = "application/json";   // config your dio headers globally
      final client = RestClient(dio);

      client.signin({"username" : login,
                     "password" : password}).then((response) {
        if (response != null && response.accessToken != null){
          print(response.accessToken);
          setState(() {
            _isLogin = true;
          });
        } else {
          setState(() {
            _isLogin = false;
          });
        }
      });
    } catch (e) {
      print("Ошибка");
      setState(() {
        _isLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin){
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_auth_page.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                children: [
                  Column(
                    children: [
                      Row(
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
                              )
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(right: 20),
                              child: Image.asset('assets/images/logo_euroskills.png', width: 100, height: 100)
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Center(
                          child: Image(image: AssetImage('assets/images/logo_hands.png'))
                      ),
                      SizedBox(height: 13,),
                      Text(
                        "Добро пожаловать в Волонтёрский центр",
                        style: TextStyle(
                          fontFamily: GoogleFonts.romanesco().fontFamily,
                          color: Color.fromARGB(250, 250, 250, 250),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 13,),
                      Text(
                        "Текст для пользователя сайта о том, что нужно ввести свои данные, чтобы войти в Личный кабинет.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.romanesco().fontFamily,
                          color: Color.fromARGB(250, 250, 250, 250),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 38,)
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(250, 250, 250, 250),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      height: 350,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.assignment_turned_in_outlined,
                        color: Colors.lightGreenAccent,
                        size: 200,
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_auth_page.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                children: [
                  Column(
                    children: [
                      Row(
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
                              )
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(right: 20),
                              child: Image.asset('assets/images/logo_euroskills.png', width: 100, height: 100)
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Center(
                          child: Image(image: AssetImage('assets/images/logo_hands.png'))
                      ),
                      SizedBox(height: 13,),
                      Text(
                        "Добро пожаловать в Волонтёрский центр",
                        style: TextStyle(
                          fontFamily: GoogleFonts.romanesco().fontFamily,
                          color: Color.fromARGB(250, 250, 250, 250),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 13,),
                      Text(
                        "Текст для пользователя сайта о том, что нужно ввести свои данные, чтобы войти в Личный кабинет.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.romanesco().fontFamily,
                          color: Color.fromARGB(250, 250, 250, 250),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 38,)
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(250, 250, 250, 250),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
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
                              TextFormField(
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
                                validator: (value){
                                  if (value!.length < 3) {
                                    return "Некорретный логин";
                                  }
                                  return null;},
                                onSaved: (value) {
                                  _loginData.login = value!;
                                },
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                obscureText: _passwordVisible,
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
                                  // suffixIcon: IconButton(
                                  //   icon: _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible;
                                  //     });
                                  //   },),
                                ),
                                validator: (value) {
                                  if (value!.length < 8){
                                    return "Пароль дожен иметь не меньше 8 символов";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _loginData.password = value!;
                                },
                              ),
                              SizedBox(height: 10,),
                              Text(
                                (_loginData.login.length > 0 &&
                                    _loginData.password.length > 0 &&
                                    _isRobot && !_isLogin) ? "Неверный логин или пароль" : " ",
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
                                        setState(() {
                                          _isRobot = isValue!;
                                        });
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
                              RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() && _isRobot) {
                                    _formKey.currentState!.save();
                                    print("Username: ${_loginData.login}");
                                    print("Password: ${_loginData.password}");
                                    login(_loginData.login, _loginData.password);
                                  }
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: _myGradient,
                                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container(
                                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 56.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Войти",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(255, 255, 255, 1)
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          )
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      );
    }
  }

}