import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/sign_provider.dart';
import 'ui/sign_ui.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SignProvider()),
          ],
          child: MaterialApp(home: App())
      ));
}
