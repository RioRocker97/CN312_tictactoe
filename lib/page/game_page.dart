
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/components/myButton.dart';
import 'package:tictactoe/logic/routing.dart';
import 'package:tictactoe/components/game_structure.dart';
class GamePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GamePageState();
  }
}

class GamePageState extends State<GamePage>{
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double pixel = MediaQuery.of(context).devicePixelRatio;
    double realw = w*pixel;
    double realh = h*pixel;
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: h/4,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(w/10),
                        child: Text("Blue",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.blue),),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(w/10),
                        child: Text("Red",style: TextStyle(fontFamily: 'baloo',fontSize: 60.0,color: Colors.red),),
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(
              height: h/2,
              child: GameStructure(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("public/pic/testBG1.jpg"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              height: h/4,
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