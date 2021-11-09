import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_logi/viewmodels/impl/form_view_model_impl.dart';
import 'package:mobile_logi/widgets/login_form.dart';
import 'package:mobile_logi/widgets/toolbar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPage();
}

class _AuthPage extends State {

  FormViewModelImpl _viewModel = FormViewModelImpl();
  bool _isLogin = false;

  @override
  void dispose() {
    _isLogin = _viewModel.outputErrorLogin.last as bool;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Toolbar(),
              SizedBox(
                height: 25,
              ),
              Center(
                  child:
                      Image(image: AssetImage('assets/images/logo_hands.png'))),
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
              StreamBuilder<bool>(
                  stream: _viewModel.outputErrorLogin,
                  builder: (context, snapshot) {
                    debugPrint("errorLogin ${snapshot.data}");
                    if (snapshot.data != null && snapshot.data! && _isLogin) {
                      return Container(
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
                      );
                    } else {
                      return LoginForm();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
