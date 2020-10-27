import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignProvider with ChangeNotifier {
  bool _boolProgressBar = false;

  bool get boolProgressBar => _boolProgressBar;

  void progressBarOn() {
    _boolProgressBar = true;
    notifyListeners();
  }
  void progressBarOff() {
    _boolProgressBar = false;
    notifyListeners();
  }
  void signIn ({email,password})async {
    print("${email} ${password}");
    await progressBarOn();
    try{
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print("ok");
    }
    catch(e){
      print("error:---------------"+e.toString());
    }
    await progressBarOff();
    notifyListeners();
  }
  void signUp ({email,password})async {
    print("${email} ${password}");
    await progressBarOn();
    try{
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print("ok");
    }
    catch(e){
      print("error:---------------"+e.toString());
    }
    await progressBarOff();
    notifyListeners();
  }

}