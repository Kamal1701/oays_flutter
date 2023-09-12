import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/firebase_options.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/themes/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OAYS',
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.light,
      home: const OAYSSignInScreen(),
    );
  }
}
