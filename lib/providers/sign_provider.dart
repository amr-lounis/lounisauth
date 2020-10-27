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
  Future<bool> signIn ({email,password})async {
    print("${email} ${password}");
    UserCredential result;
    await progressBarOn();
    result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    await progressBarOff();
    print("log --------------  signIn");
    notifyListeners();
    return (result != null);
  }
  void signUp ({email,password})async {
    print("${email} ${password}");
    await progressBarOn();
    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print(result.user);
    await progressBarOff();
    print("log --------------  signUp");
    notifyListeners();
  }
  void signOut ()async {
    await FirebaseAuth.instance.signOut();
    print("log --------------   signOut");
    notifyListeners();
  }

}