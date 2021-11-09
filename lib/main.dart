import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_logi/pages/auth_page.dart';
import 'package:mobile_logi/pages/start_page.dart';

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
    return MaterialApp(
      routes: {
        '/': (context) => StartPage(),
        '/auth': (context) => AuthPage(),
      },
    );
  }
}
