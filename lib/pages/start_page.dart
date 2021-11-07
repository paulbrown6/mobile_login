import 'package:flutter/material.dart';
import 'package:mobile_logi/widgets/gradient_button.dart';
import 'auth_page.dart';

class StartPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_start_page.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              children:  [
                Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/logo_euroskills.png', width: 100, height: 100)
                ),
                SizedBox(height: 50,),
                Center(
                  child:
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/logo_volunteer.png')),
                          SizedBox(height: 50,),
                          Builder(
                            builder: (context) => Center(
                              child:
                              GradientButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => const AuthPage(),
                                  ));
                                },
                                buttonText: 'Войти',
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                )
              ]
          )
      ),
    );
  }

}