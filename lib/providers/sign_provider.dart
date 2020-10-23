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
    await progressBarOn();
    await Future.delayed(const Duration(seconds: 2), () {
      print("${email} ${password}");
    });
    await progressBarOff();
    notifyListeners();
  }

}