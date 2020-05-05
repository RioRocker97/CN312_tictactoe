
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class GameStructure extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameStructureState();
  }
}
class GameStructureState extends State<GameStructure>{

  bool mycolor = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //bool mycolor = true;
    //debugPaintPointersEnabled = true;
    return Center(
      child: Column(
        children: <Widget>[
          Row( children: <Widget>[
            InkWell(
              onTap: (){
                setState(() {
                  mycolor = false;
                  print(mycolor);
                });
              },
              child: Padding(
                padding: EdgeInsets.all(w/30),
                child: Container(width: 100.0,height: 100.0,color: mycolor ? Colors.blue:Colors.green,child: Text(mycolor.toString()),),
              ),
            ),
          ],
          ),
        ],
      ),
    );
  }
}