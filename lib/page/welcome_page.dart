import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/components/myButton.dart';
import 'package:tictactoe/logic/routing.dart';
class WelcomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage("public/pic/TicTacToeBG.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            child: welcomeButton(session: (){setState(() {
              welcomeRoute(context);
            });}),
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: w/10.0),
          ),
        )
      )
    );
  }
}