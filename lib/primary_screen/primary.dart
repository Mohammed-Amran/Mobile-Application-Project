import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/authentication/login.dart';


class Primary extends StatefulWidget {
  const Primary({super.key});

  @override
  PrimaryScreen createState() => PrimaryScreen();
}



class PrimaryScreen extends State<Primary> {
  

 

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
            
                      Navigator.push( context, MaterialPageRoute( builder: (context) => const Plumber(), ), );       

                                                    },

                                      backgroundColor: const Color(0xFFE5E1DA),
                                      child: Image.asset('assets/plumber.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs



          FloatingActionButton.small( onPressed: () {

                               Navigator.push( context, MaterialPageRoute( builder: (context) => const Electrician(), ), );

                                                    },
                                      child: Image.asset('assets/electrician.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs


          FloatingActionButton.small( onPressed: () {

                          Navigator.push( context, MaterialPageRoute( builder: (context) => const Gardener(), ), );       

                                                    },
                                      backgroundColor: const Color(0xFFE5E1DA),
                                      child: Image.asset('assets/gardener.png', fit: BoxFit.cover),
                                    ),


          const SizedBox(width: 8), // Space between FABs


          FloatingActionButton.small( onPressed: () {

                            Navigator.push( context, MaterialPageRoute( builder: (context) => const Cartender(), ), );

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

                                        ListTile(leading: const Icon(Icons.manage_accounts),
                                                 title: const Text("Account"),
                                                 onTap: () {},
                                                ),

                                        ListTile(leading: const Icon(Icons.logout),
                                                 title: const Text("Logout"),
                                                 onTap: () {

                                                   Navigator.pushAndRemoveUntil(context, 

                                                                                MaterialPageRoute(
                                                                                builder: (context) => const LogIn(), 
                                                                                                 ),
                                                                                                
                                                                               (Route<dynamic> route) => false, // Clears the navigation stack
                                                                               );
                                                            },
                                                ),

                                        ],

                                     ),
                     ),
    
    
    body:

    Center(
  child: SingleChildScrollView(  // Wrapping the Column with SingleChildScrollView to make it scrollable
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



      bottomNavigationBar:const BottomAppBar(

        shape:  CircularNotchedRectangle(),

        notchMargin: 8,

        child: SizedBox(

          height: 70,



        ),

      ),
   
   
   //The middle Home Icon.
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Primary(),
      ),
    );

          
        },
        child:const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   
   
    );
  }
}
