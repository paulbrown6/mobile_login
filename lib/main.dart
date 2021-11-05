import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_logi/pages/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    const _myGradient = LinearGradient(
        begin : Alignment.centerLeft,
        end : Alignment.topRight,
        colors : [ Color(0xFF403B5E), Color(0xFFAA5A6B) ],
        tileMode : TileMode.repeated
    );

    return MaterialApp(
      home: Scaffold(
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
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => const AuthPage(),
                                  ));
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
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
                            ),
                          ),
                        ]
                    ),
                  ),
              )
            ]
          )
        ),
      ),
    );
  }
}
