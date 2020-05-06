
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/logic/game_logic.dart';

//////////// Main Game Components ///////////////////////
/*class GameStructure extends StatelessWidget {
  GameStructure({this.change,this.onTapEvent, this.game,});
  bool change;
  Function onTapEvent;
  TicTacToe game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              GameSlot(onTapE: onTapEvent,c: change,id: 1),
              GameSlot(onTapE: onTapEvent,c: change,id: 2),
              GameSlot(onTapE: onTapEvent,c: change,id: 3),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              GameSlot(onTapE: onTapEvent,c: change,id: 1),
              GameSlot(onTapE: onTapEvent,c: change,id: 2),
              GameSlot(onTapE: onTapEvent,c: change,id: 3),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              GameSlot(onTapE: onTapEvent,c: change,id: 1),
              GameSlot(onTapE: onTapEvent,c: change,id: 2),
              GameSlot(onTapE: onTapEvent,c: change,id: 3),
            ],
          ),
        ),
      ],
    );
  }
}
*/

class GameSlot extends StatelessWidget{
  GameSlot({this.onTapE,this.id});
  Function onTapE;
  int id;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //debugPaintSizeEnabled = true;
    // TODO: implement build
    return new Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTapE,
        child: Padding(
          padding: EdgeInsets.all(w/40),
          child: Container(
            width: 100.0,
            height: 100.0,
            //color: c ? Colors.blue : Colors.red,
            child: Center(
              child: id==0 ? null : (id==1 ? Image(image: AssetImage('public/pic/X_blue.png')) : Image(image: AssetImage('public/pic/O_red.png'))) ,
            )
          ),
        ),
      ),
    );
  }
}

///////// Main Game Score Board /////////////////
class GameScore extends StatelessWidget{
  GameScore({this.side1Score,this.side2Score,this.turn});
  bool turn;

  int side1Score ;
  int side2Score ;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
        height: h/4,
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: h/20),
                        child: Container(
                          child: Center(
                              child: Text("Blue",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.blue))
                          ),
                          color: turn ? Colors.amberAccent : null,
                        )
                      ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: h/20),
                        child: Container(
                          child: Center(
                              child: Text("Red",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.red))
                          ),
                          color: turn ? null : Colors.amberAccent,
                        )
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                        child: Text(side1Score.toString(),style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.blue))
                    )
                  ),
                  Expanded(
                      child: Center(
                        child: Text(side2Score.toString(),style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.red))
                      )
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}