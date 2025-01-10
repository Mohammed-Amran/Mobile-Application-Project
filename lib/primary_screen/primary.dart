import 'package:flutter/material.dart';

import 'package:support_for_better_livingspace/login.dart';
import 'package:support_for_better_livingspace/screens/cartender.dart';
import 'package:support_for_better_livingspace/screens/electrician.dart';
import 'package:support_for_better_livingspace/screens/favourite.dart';
import 'package:support_for_better_livingspace/screens/gardener.dart';
//import 'package:support_for_better_livingspace/screens/history.dart';
import 'package:support_for_better_livingspace/screens/plumber.dart';
import 'package:support_for_better_livingspace/screens/view_request_status.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


class Primary extends StatefulWidget {
  
final String email; // Receive the email from the previous screen

  const Primary({super.key, required this.email});

  @override
  PrimaryScreen createState() => PrimaryScreen();
}



class PrimaryScreen extends State<Primary> {
   
String name = '';
String phoneNumber = '';


@override
void initState() {
                   super.initState();
                   fetchUserData();
                 }



Future<void> fetchUserData() async 
{
   
    final firestore = FirebaseFirestore.instance;

  try {
        final querySnapshot = await firestore
          .collection('users')
          .where('Email', isEqualTo: widget.email) // Use the email
          .get();

       if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        setState(() {
          name = userData['FullName'] ?? 'No Name';
          phoneNumber = userData['Phone'] ?? 'No Phone';
        });
       }
    } 
    catch (e) {
                // Handle errors here
              }

}

 

@override
Widget build(BuildContext context) {
  return Scaffold(

appBar: PreferredSize(

  preferredSize: const Size.fromHeight(80), // Adjust the height of the AppBar as needed

  child: Container(
    color: const Color(0xFFB3C8CF), // Set the desired background color
    padding: const EdgeInsets.only(top: 20, bottom: 10), // Add space to the top and bottom
    child: AppBar( backgroundColor: Colors.transparent, // Make the AppBar background transparent to show the container color
                   elevation: 0, // Remove shadow for a clean look
                   leadingWidth: 540,
                   leading: Row( 
                    
          children: [


          Builder(builder: (context) => IconButton( icon: const Icon(Icons.menu), onPressed: () { Scaffold.of(context).openDrawer(); }, ), ),


          const SizedBox(width: 8), // Space between menu and FABs


          FloatingActionButton.small( onPressed: () { 
            
                      Navigator.push( context, MaterialPageRoute( builder: (context) =>  Plumber(email: widget.email), ), );       

                                                    },

                                      backgroundColor: const Color(0xFFE5E1DA),
                                      child: Image.asset('assets/plumber.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs



          FloatingActionButton.small( onPressed: () {

                               Navigator.push( context, MaterialPageRoute( builder: (context) =>  Electrician(email: widget.email), ), );

                                                    },
                                      child: Image.asset('assets/electrician.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs


          FloatingActionButton.small( onPressed: () {

                          Navigator.push( context, MaterialPageRoute( builder: (context) => Gardener(email: widget.email), ), );       

                                                    },
                                      backgroundColor: const Color(0xFFE5E1DA),
                                      child: Image.asset('assets/gardener.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs


          FloatingActionButton.small( onPressed: () {

                            Navigator.push( context, MaterialPageRoute( builder: (context) => Cartender(email: widget.email), ), );

                                                     },
                                      backgroundColor: const Color(0xFFE5E1DA),
                                      child: Image.asset('assets/cartender.png', fit: BoxFit.cover),
                                    ),
       

                                           ],

      ),

    ),

  ),

),





  drawer: Drawer( child: ListView(

                             padding: EdgeInsets.zero,

                             children: [


                                          DrawerHeader(                                          
                                                        child: Column(
                                                      
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                        
                                                                      children: [const Icon(Icons.person, size: 50),
                 
                                                                                 Text(name, style: const TextStyle(fontSize: 18)),
                                                                                 
                                                                                 Text(phoneNumber, style: const TextStyle(fontSize: 16)),
               
                                                                                ],
                                                                     ),
            
                                                       ),

                                          


                                          ListTile(
                                                   leading: const Icon(Icons.history),
                                                   
                                                   title: const Text("History"),
                                                            
                                                   onTap: () {
                                                            /*   Navigator.pushAndRemoveUntil(context, 

                                                                                            MaterialPageRoute( builder: (context) => History(email: widget.email,) ),
                                                                                                           
                                                                                            (Route<dynamic> route) => false, // Clears the navigation stack
                                                                                           );
                                                          */   }

                                                 ),


                                         ListTile(
                                                   leading: const Icon(Icons.logout),
                                                   
                                                   title: const Text("Logout"),
                                                            
                                                   onTap: () {
                                                               Navigator.pushAndRemoveUntil(context, 

                                                                                            MaterialPageRoute( builder: (context) => const LogIn() ),
                                                                                                           
                                                                                            (Route<dynamic> route) => false, // Clears the navigation stack
                                                                                           );
                                                             }

                                                 ),

                                      ],

                                     ),
                  ),
    
    
  body:  Center( child: SingleChildScrollView(  // Wrapping the Column with SingleChildScrollView to make it scrollable
          
           child: Column( mainAxisAlignment: MainAxisAlignment.center,
                 
                  children: [
       
        // First Curved Rectangle
         Container( margin: const EdgeInsets.symmetric(vertical: 15), /* Add margin for separation */
                 
                  height: MediaQuery.of(context).size.height * 0.3, // Adjust height (30% of screen height)
 
                  width: double.infinity, // Full width
              
                  decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15), /* Curved edges*/  ),
 
                  child: ClipRRect( borderRadius: BorderRadius.circular(15), /* Ensure the photo respects the border radius */
    
                                    child: Stack( children: [ 
                  
                                                    Image.asset('assets/plumberREKLAM.jpeg', fit: BoxFit.cover, /* Fill the container */ width: double.infinity, height: double.infinity ),
                                        
                                                             ],

                                                ),
 
                                  ),
           
                ),
       

        // Second Curved Rectangle
       Container( margin: const EdgeInsets.symmetric(vertical: 15), /* Add margin for separation */
                 
                  height: MediaQuery.of(context).size.height * 0.3, // Adjust height (30% of screen height)
 
                  width: double.infinity, // Full width
              
                  decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15), /* Curved edges*/  ),
 
                  child: ClipRRect( borderRadius: BorderRadius.circular(15), /* Ensure the photo respects the border radius */
    
                                    child: Stack( children: [ 
                  
                                                    Image.asset('assets/electricianREKLAM.jpeg', fit: BoxFit.cover, /* Fill the container */ width: double.infinity, height: double.infinity ),
                                        
                                                             ],

                                                ),
 
                                  ),
           
                ),


       //Third Curved Rectangle
        Container( margin: const EdgeInsets.symmetric(vertical: 15), /* Add margin for separation */
                 
                  height: MediaQuery.of(context).size.height * 0.3, // Adjust height (30% of screen height)
 
                  width: double.infinity, // Full width
              
                  decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15), /* Curved edges*/  ),
 
                  child: ClipRRect( borderRadius: BorderRadius.circular(15), /* Ensure the photo respects the border radius */
    
                                    child: Stack( children: [ 
                  
                                                    Image.asset('assets/CartenderREKLAM.jpeg', fit: BoxFit.cover, /* Fill the container */ width: double.infinity, height: double.infinity ),
                                        
                                                             ],

                                                ),
 
                                  ),
           
                ),



      ], //closing bracket of the children that contains all the widgets.

    ),

  ),

),



bottomNavigationBar: BottomAppBar( shape: const CircularNotchedRectangle(),
  
                                  notchMargin: 8,
  
                                  child: SizedBox( height: 70, child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
     
                                                                           children: [
                                                                                       // Left-side button
                                                                                       Padding( padding: const EdgeInsets.only(left: 50),
          
                 child: SizedBox(width: 70, height: 70,
                      
                                 child: IconButton( icon: const Icon(Icons.timelapse),
              
                                                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Request(email: widget.email)),); },
                                     
                                                  ),
                  
                                ),
               ),
                                                                                       
                                                                                       // Spacer to center the home button
                                                                                       const SizedBox(width: 48),
                                                                                       
                                                                                       // Right-side button
                                                                                       Padding( padding: const EdgeInsets.only(right: 50),
                                                                                         
                                                                                               child: SizedBox(width: 70, height: 70,
                                                                                           
                                                                                                               child: IconButton(icon: const Icon(Icons.star), // Replace with your desired icon
                                                                                             
                                                                                                                                 onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite(email: widget.email)) ); },
                                                                                                                                ),
                                                                                                              ),
                                                                                              ),
                                                                                     ],
                               
                                                                          ),
  
                                                 ),

                                ),


// The middle Home Icon
floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Primary(email: '',)),
    );
  },
  child: const Icon(Icons.home),
),

floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

   
    );
  }
}
