import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import '../widgets/progress_bar_widget.dart';
import '../widgets/sign_In_widget.dart';
import '../widgets/sign_up_widget.dart';
import '../providers/sign_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {return MyHomePageError();}
        if (snapshot.connectionState == ConnectionState.done) { return MyHomePage();}
        return MyHomePageLoading();
      },
    );
  }
}
class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(),
      body:widgetBody(context),
    );
  }
  widgetAppBar(){
    return AppBar();
  }
  widgetBody(BuildContext context){
    return ProgressBarWidget(
      status: context.watch<SignProvider>().boolProgressBar,
      child: Center(
          child:ListView(
            children: <Widget>[
              SignInWidget( onSignIn:(email,password){
                context.read<SignProvider>().signIn(email: email,password:password );
              }),
              SignUpWidget( onSignUp:(email,password){
                context.read<SignProvider>().signUp(email: email,password:password );
              }),
            ],)
      ),
    );
  }
}
class MyHomePageError extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(),
      body:widgetBody(context),
    );
  }
  widgetAppBar(){
    return AppBar();
  }
  widgetBody(BuildContext context){
    return  Center(
          child: Text("Error"),
    );
  }
}

class MyHomePageLoading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(),
      body:widgetBody(context),
    );
  }
  widgetAppBar(){
    return AppBar();
  }
  widgetBody(BuildContext context){
    return  Center(
      child: Text("Loading"),
    );
  }
}


