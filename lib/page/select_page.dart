import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/components/myButton.dart';
import 'package:tictactoe/logic/routing.dart';
class SelectPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectPageState();
  }
}
class SelectPageState extends State<SelectPage>{
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
                      image:  AssetImage("public/pic/testBG1.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                child: selectButton(session: (){setState(() {
                  selectRoute(context);
                });}),
              ),
            )
        )
    );
  }
}