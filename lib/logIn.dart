// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/Register.dart';
import 'primary_screen/primary.dart';
import 'package:support_for_better_livingspace/labour/labour.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  // Controllers for email and password fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1DA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Email Text Field.
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 19,),

            //Password Text Field.
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 19,),

            //The LogIn button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await loginUser(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF89A8B2), // Background color
                    foregroundColor: const Color(0xFFF1F0E8), // Text color
                  ),
                  child: const Text('LogIn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 19,),

            //The line that includes the link to SignUp screen.
            RichText(
              text: TextSpan(
                text: "Dont have an account!?", 
                style: const TextStyle(color: Colors.black, fontSize: 17),
                children: [
                  TextSpan(
                    text: 'Register Here!',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp() ) );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }





  // Function to handle user login
  Future<void> loginUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validate user input
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    try {
      // Reference to Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the 'labours' collection to find a matching user
      final labourQuerySnapshot = await firestore
          .collection('labours') // Check the 'labours' collection
          .where('Email', isEqualTo: email)
          .where('Password', isEqualTo: password)
          .get();

      // If a match is found in 'labours'
      if (labourQuerySnapshot.docs.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Labour(email: email)),
        );
        return;
      }

      // Query Firestore to find a matching user in 'users' collection if not found in 'labours'
      final userQuerySnapshot = await firestore
          .collection('users')
          .where('Email', isEqualTo: email)
          .where('Password', isEqualTo: password)
          .get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        // User found, navigate to the primary screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Primary(email: email)),
        );
      } else {
        // No matching user found
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password.')),
        );
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }
}
