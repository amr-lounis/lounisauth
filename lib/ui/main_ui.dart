import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/sign_In_widget.dart';
import '../widgets/sign_up_widget.dart';
import '../providers/sign_provider.dart';


class MyHomePage extends StatelessWidget {
  @override
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

              }),
            ],)
      ),
    );
  }
}

