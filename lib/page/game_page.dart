import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/components/myButton.dart';
import 'package:tictactoe/logic/routing.dart';
import 'package:tictactoe/logic/game_logic.dart';
import 'package:tictactoe/components/game_structure.dart';
class GamePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GamePageState();
  }
}
class GamePageState extends State<GamePage>{
  TicTacToe mainGame = new TicTacToe();
  bool playerSide = true;
  bool gameSet = false;
  List playerSlot =[
    [0,0,0],
    [0,0,0],
    [0,0,0],
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //debugPaintSizeEnabled = true;
    ///// Game Logic /////
    void playSlot(int x,int y){
      int side = playerSide ? 1 : 2;
      if(playerSlot[x-1][y-1] == 0){
        mainGame.calculatePoint(x,y,side);
      }
      else{print("Someone is already play this slot . Try again next turn !");}
      gameSet = mainGame.getWinner();
      playerSlot = mainGame.getSideSlot();
      print(side==1 ? "Red is playing..." : "Blue is playing..");
      if(gameSet == true){print("Game Set !!");}
      else{playerSide = playerSide ? false : true;}
    }
    ///// Game Logic /////
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            //////////////////////////Score Board ////////////////////////////////////////
            GameScore(side1Score: mainGame.getSide1Win(),side2Score: mainGame.getSide2Win(),turn: playerSide,),
            //////////////////////////Score Board ////////////////////////////////////////

            //////////////////////////Game Structure ////////////////////////////////////////
            Container(
              height: h/2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          GameSlot(onTapE:(){setState(() {playSlot(1,1);});},id: playerSlot[0][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(1,2);});},id: playerSlot[0][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(1,3);});},id: playerSlot[0][2]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          GameSlot(onTapE:(){setState(() {playSlot(2,1);});},id: playerSlot[1][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(2,2);});},id: playerSlot[1][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(2,3);});},id: playerSlot[1][2]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          GameSlot(onTapE:(){setState(() {playSlot(3,1);});},id: playerSlot[2][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(3,2);});},id: playerSlot[2][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(3,3);});},id: playerSlot[2][2]),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("public/pic/TicTacToe_Grid.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("public/pic/testBG1.jpg"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            //////////////////////////Game Structure ////////////////////////////////////////

            /////////////////////////Game Reset + Routing ///////////////////////////////////
            Container(
              height: h/4,
              color: Colors.blueGrey,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(w/40),
                        child: gameButton(session: (){setState(() {
                          gameRoute(context,1,score1: mainGame.getSide1Win(),score2: mainGame.getSide2Win());
                        });},high: h/8,wide: w/2,myText: "End",)
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(w/40),
                          child: gameButton(session: (){setState(() {
                            gameRoute(context,2);
                            mainGame.resetSession();
                          });},high: h/8,wide: w/2,myText: "Reset",)
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

