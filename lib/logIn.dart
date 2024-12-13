import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/Register.dart';
import 'primary_screen/primary.dart';

class LogIn extends StatelessWidget{

const LogIn({super.key});

@override
Widget build(BuildContext context){


return Scaffold(

backgroundColor: const Color(0xFFE5E1DA),

body: Padding(
              padding: const EdgeInsets.all(20.0),

      child: Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

                  //Email Text Field.
                  TextField(

                    controller: TextEditingController(), 

                    decoration:const InputDecoration(labelText: 'email', border: OutlineInputBorder()),

                  ),

                  const SizedBox(height: 19,),

                  //Password Text Field.
                  TextField(

                    controller: TextEditingController(),

                    decoration: const InputDecoration(labelText: 'password', border: OutlineInputBorder()),

                  ),


                  const SizedBox(height: 19,),


                  //The LogIn button
                  Row( mainAxisAlignment: MainAxisAlignment.center ,

                       children: [ ElevatedButton(onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Primary())); },

                                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF89A8B2), //Background color
                                                                                  foregroundColor: const Color(0xFFF1F0E8), //Text color
                                                                                 ),

                                                  child: const Text('LogIn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

                                                                        
                                  ],//closing bracket of the children.
                  
                      ),


                  const SizedBox(height: 19,),


                 //The line that includes the link to SignUp screen.
                  RichText( text:TextSpan( text: "Dont have an account!?", style: const TextStyle(color: Colors.black, fontSize: 17), 

                                           children: [ TextSpan(text: 'Register Here!', 
                                                                  
                                                                style: const TextStyle( color: Colors.red, 
                                                                                        fontWeight: FontWeight.bold, 
                                                                                        decoration: TextDecoration.underline
                                                                                      ),
                                                            
                                                                recognizer: TapGestureRecognizer() 
                                                               
                                                                ..onTap = () {

                                                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const SingUp()) ); 
                                                                            
                                                                             },

                                                                ),
                                                  

                                                      ],//closing bracket of the TextSpan
                  
                  
              
                                        ),                
                  
                  
                  
                           ),
          


                ],//closing bracket of the Column-children.




              ),
 

            ),

);



}//closing bracket of the build method.

}//closing bracket of the class.
