import 'package:flutter/material.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/themes/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAYS',
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.light,
      home: const OAYSSignInScreen(),
    );
  }
}
