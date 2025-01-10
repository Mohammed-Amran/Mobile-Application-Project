// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignUp extends StatelessWidget {
  
  SignUp({super.key});

  // Defining TextEditingControllers.
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1DA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Full-Name Text Field
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 19),

            // Email Text Field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 19),

            // Password Text Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 19),

            // Phone Number Text Field
            TextField(
              controller: phoneNoController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register Button
                ElevatedButton(
                  onPressed: () {
                    _showRoleSelectionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF89A8B2),
                    foregroundColor: const Color(0xFFF1F0E8),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10.0),

                // Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF89A8B2),
                    foregroundColor: const Color(0xFFF1F0E8),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show role selection dialog
  void _showRoleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register As Who?'),
          content: const Text('How do you identify yourself?'),
          actions: [
            // Register as User
            TextButton(
              onPressed: () {
                _register(context, 'users');
              },
              child: const Text('User'),
            ),

            // Register as Labour
            TextButton(
              onPressed: () {
                _register(context, 'labours');
              },
              child: const Text('Labour'),
            ),
          ],
        );
      },
    );
  }

  // Function to register user in a specific collection
  Future<void> _register(BuildContext context, String collection) async {
    // Validate input fields
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneNoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields.')),
      );
      return;
    }

    try {
      // Save user data to Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection(collection).add({
        'FullName': fullNameController.text,
        'Email': emailController.text,
        'Password': passwordController.text, // Avoid storing plain text passwords
        'Phone': phoneNoController.text,
      });

      // Show success message
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: Text('Registered successfully as $collection.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Navigate back
                Navigator.pop(context); // Navigate back
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      // Clear fields after successful registration
      fullNameController.clear();
      emailController.clear();
      passwordController.clear();
      phoneNoController.clear();
    } catch (e) {
      // Show error message
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Failed to register: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
