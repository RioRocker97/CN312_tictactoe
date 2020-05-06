
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/logic/game_logic.dart';

//////////// Main Game Components ///////////////////////
class GameStructure extends StatelessWidget {
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

class GameSlot extends StatelessWidget{
  GameSlot({this.onTapE,this.c,this.id});
  Function onTapE;
  int id;
  bool c;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Expanded(
      child: GestureDetector(
        onTap: onTapE,
        child: Padding(
          padding: EdgeInsets.all(w/40),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: c ? Colors.green : Colors.redAccent,
            child: Center(
              child: Text(id.toString(),style: TextStyle(fontSize: 20.0,fontFamily: 'baloo'),),
            ),
          ),
        ),
      ),
    );
  }
}

///////// Main Game Score Board /////////////////
class GameScore extends StatelessWidget{
  GameScore({this.side1Score,this.side2Score});

  int side1Score ;
  int side2Score ;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        height: h/4,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: h/20),
                        child: Center(
                            child: Text("Blue",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.blue))
                        ),
                      ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: h/20),
                      child: Center(
                          child: Text("Red",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.red))
                      ),
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