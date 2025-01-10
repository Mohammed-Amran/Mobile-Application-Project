import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:support_for_better_livingspace/logIn.dart';

void main() async {
  // Ensure Flutter binding is initialized and Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Support for better livingSpace',
      home: LogIn(), // Your logIn screen here
    );
  }
}
