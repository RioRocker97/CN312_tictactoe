import 'package:flutter/material.dart';
import 'package:tictactoe/page/welcome_page.dart';
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }
}

void main() => runApp(MaterialApp(home: MyApp()));

