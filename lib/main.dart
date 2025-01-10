import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:support_for_better_livingspace/log_in.dart';

// Firebase configuration for Web (use the configuration from Firebase Console)
const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyAwWOOJpKla9aXLPcmNKvUB_QYNdLoVNs0",
  authDomain: "mobileapp-d7bf9.firebaseapp.com",
  projectId: "mobileapp-d7bf9",
  storageBucket: "mobileapp-d7bf9.firebasestorage.app",
  messagingSenderId: "44508729137",
  appId: "1:44508729137:web:b07157c6592a5abb6faa10",
  measurementId: "G-4LB9V0N7BW",
);

void main() async {
  // Ensure Flutter binding is initialized and Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);  // Use the firebaseConfig for Web

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Support for better livingSpace',
      home: LogIn(), // Your logIn screen here
    );
  }
}
