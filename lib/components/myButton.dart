import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class welcomeButton extends StatelessWidget{
  welcomeButton({@required this.session});
  Function session;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text("Start",style: TextStyle(fontSize: 50.0,fontFamily: 'dora'),),
          color: Colors.blue,
          textColor: Colors.redAccent,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: session,
        )
      ],
      buttonHeight: 80.0,
      buttonMinWidth: 250.0,
      alignment: MainAxisAlignment.center,
    );
  }
}

class selectButton extends StatelessWidget{
  selectButton({@required this.session});
  Function session;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[Icon(Icons.person,size: 50.0,color: Colors.redAccent,),Text("1 VS 1",style: TextStyle(fontSize: 50.0,fontFamily: 'dora'))],
          ),
          color: Colors.blue,
          textColor: Colors.redAccent,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: session,
        )
      ],
      buttonHeight: 80.0,
      buttonMinWidth: 250.0,
      alignment: MainAxisAlignment.center,
    );
  }
}