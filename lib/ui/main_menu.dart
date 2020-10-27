import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lounisauth/providers/sign_provider.dart';
import 'package:provider/provider.dart';

import 'sign_ui.dart';
class MainMenuPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(context),
      body:widgetBody(context),
    );
  }
  widgetAppBar(BuildContext context){
    return AppBar(
      actions: <Widget>[
    RaisedButton(
    child: Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.white),),
    color: Colors.blue,
    onPressed: () {
      context.read<SignProvider>().signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage() ));
    }),]
    );
  }
  widgetBody(BuildContext context){
    return  Center(
      child: Text("MainMenu"),
    );
  }
}


