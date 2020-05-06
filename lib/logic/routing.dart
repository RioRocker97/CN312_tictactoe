import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/logic/game_logic.dart';

import 'package:tictactoe/page/welcome_page.dart';
import 'package:tictactoe/page/select_page.dart';
import 'package:tictactoe/page/game_page.dart';
import 'package:tictactoe/page/end_page.dart';

Function welcomeRoute(BuildContext context){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> SelectPage())
  );
  return null;
}
Function selectRoute(BuildContext context){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> GamePage())
  );
  return null;
}
Function gameRoute(BuildContext context,int id,{int score1,int score2}){
  if(id == 1){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>EndPage(
      side1Score: score1,
      side2Score: score2,
    )));
  }
  else if(id==2){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
  }
}
Function EndRoute(BuildContext context){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage())
  );
}