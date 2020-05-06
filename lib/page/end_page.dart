import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/components/myButton.dart';
import 'package:tictactoe/logic/routing.dart';
class EndPage extends StatefulWidget{
  EndPage({@required this.side1Score,this.side2Score});
  int side1Score ;
  int side2Score ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EndPageState(side1Score: side1Score,side2Score: side2Score);
  }
}
class EndPageState extends State<EndPage>{
  EndPageState({@required this.side1Score,this.side2Score});
  int side1Score;
  int side2Score;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: h/10),
                      child: Text("Blue",style: TextStyle(fontFamily: 'baloo',fontSize: 30.0,color: Colors.blue),),
                    ),
                  )
                ),
                Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: h/10),
                        child: Text("Red",style: TextStyle(fontFamily: 'baloo',fontSize: 30.0,color: Colors.red),),
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: h/50),
                        child: Text(side1Score.toString(),style: TextStyle(fontFamily: 'baloo',fontSize: 30.0,color: Colors.blue),),
                      ),
                    )
                ),
                Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: h/50),
                        child: Text(side2Score.toString(),style: TextStyle(fontFamily: 'baloo',fontSize: 30.0,color: Colors.red),),
                      ),
                    )
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: h/10),
                child: Text(side1Score == side2Score ? "Draw !!!" : (side1Score > side2Score ? "Blue Win !!!" : "Red Win !!!"),
                style: TextStyle(fontFamily: 'baloo',fontSize: 70.0,color: side1Score == side2Score ? Colors.amberAccent :
                (side1Score > side2Score ? Colors.blue : Colors.red)),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:h/10),
              child: gameButton(session: (){
                setState(() {
                  EndRoute(context);
                });
              },wide: 200.0,high: 100.0,myText:"Go Back"),
            ),
          ],
        ),
        width: w,
        height: h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("public/pic/testBG1.jpg"),
            fit: BoxFit.cover
          )
        ),
      )
    );
  }
}