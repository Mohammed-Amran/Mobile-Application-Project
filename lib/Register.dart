import 'package:flutter/material.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1DA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            //Full-Name Text Field.
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  labelText: 'Full Name', border: OutlineInputBorder()),
            ),

            const SizedBox(
              height: 19,
            ),

            //Email Text Field.
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),

            const SizedBox(
              height: 19,
            ),

            //Password Text Field.
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  labelText: 'password', border: OutlineInputBorder()),
            ),

            const SizedBox(
              height: 19,
            ),

            //PhoneNumber Text Field.
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  labelText: 'PhoneNo.', border: OutlineInputBorder()),
            ),

            const SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF89A8B2), // Change background color
                      foregroundColor:
                          const Color(0xFFF1F0E8), // Change text color
                    ),
                    child: const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                //Separator between Elevetaed Buttons.
                const SizedBox(
                  width: 10.0,
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF89A8B2),
                        foregroundColor: const Color(0xFFF1F0E8)),
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ], //closing bracket of the children.
            ),
          ], //closing bracket of the Column-children.
        ),
      ),
    );
  } //closing bracket of the build method.
}//closing bracket of the class.