import 'package:dio_http/dio_http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_logi/retrofit/api.dart';
import 'package:mobile_logi/widgets/login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPage();
}

class LoginData {
  String login = "";
  String password = "";
}

class _AuthPage extends State {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_auth_page.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
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
                          )),
                      Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Image.asset(
                              'assets/images/logo_euroskills.png',
                              width: 100,
                              height: 100)),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Image(
                          image: AssetImage('assets/images/logo_hands.png'))),
                  SizedBox(
                    height: 13,
                  ),
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
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Текст для пользователя сайта о том, что нужно ввести свои данные, чтобы войти в Личный кабинет.",
                    style: TextStyle(
                      fontFamily: GoogleFonts.romanesco().fontFamily,
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 38,
                  )
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
            ]),
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
                        )),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 20),
                        child: Image.asset('assets/images/logo_euroskills.png',
                            width: 100, height: 100)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: Image(
                        image: AssetImage('assets/images/logo_hands.png'))),
                SizedBox(
                  height: 13,
                ),
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
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Текст для пользователя сайта о том, что нужно ввести свои данные, чтобы войти в Личный кабинет.",
                  style: TextStyle(
                    fontFamily: GoogleFonts.romanesco().fontFamily,
                    color: Color.fromARGB(250, 250, 250, 250),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 38,
                ),
                LoginForm(
                    controller: controller,
                    errorEmailText: errorEmailText,
                    errorPasswordText: errorPasswordText,
                    errorLogin: errorLogin,
                    onPressed: onPressed)
              ],
            ),
          ),
        ),
      );
    }
  }
}
