
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
  bool mycolor = true;
  var toggle = [
    [true,true,true],
    [true,true,true],
    [true,true,true]
  ];
  var slot = [
    [1,1,1],
    [1,1,1],
    [1,1,1]
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //debugPaintSizeEnabled = true;
    void playSlot(int x,int y){
      var posx = x-1;
      var posy = y-1;
      mycolor = mycolor ? false : true;
      toggle[posx][posy] = toggle[posx][posy] ? false : true;
      if(mycolor){
        slot[posx][posy] = 2;
      }
      else{slot[posx][posy] = 1;}
      print(mycolor);
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            //////////////////////////Score Board ////////////////////////////////////////
            GameScore(side1Score: mainGame.getSide1Win(),side2Score: mainGame.getSide2Win(),turn: mycolor,),
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
                          GameSlot(onTapE:(){setState(() {playSlot(1,1);});},c: toggle[0][0],id: slot[0][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(1,2);});},c: toggle[0][1],id: slot[0][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(1,3);});},c: toggle[0][2],id: slot[0][2]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          GameSlot(onTapE:(){setState(() {playSlot(2,1);});},c: toggle[1][0],id: slot[1][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(2,2);});},c: toggle[1][1],id: slot[1][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(2,3);});},c: toggle[1][2],id: slot[1][2]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          GameSlot(onTapE:(){setState(() {playSlot(3,1);});},c: toggle[2][0],id: slot[2][0]),
                          GameSlot(onTapE:(){setState(() {playSlot(3,2);});},c: toggle[2][1],id: slot[2][1]),
                          GameSlot(onTapE:(){setState(() {playSlot(3,3);});},c: toggle[2][2],id: slot[2][2]),
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
                          gameRoute(context,1);
                        });},high: h/8,wide: w/2,myText: "End",)
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(w/40),
                          child: gameButton(session: (){setState(() {
                            gameRoute(context,2);
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

