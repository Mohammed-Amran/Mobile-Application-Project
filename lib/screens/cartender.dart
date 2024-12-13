import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/primary_screen/primary.dart';

class Cartender extends StatefulWidget{

const Cartender({super.key});

@override
CartenderScreen createState() => CartenderScreen();

}



class CartenderScreen extends State<Cartender> {



@override
Widget build(BuildContext context){

return Scaffold(

body:SingleChildScrollView(
                      
                      child: Column( children: [

      // First Widget
      Container( margin: const EdgeInsets.symmetric(vertical: 15),

                 height: MediaQuery.of(context).size.height * 0.3,

                 width: double.infinity,

                 decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15) /* Curved edges*/ ),
      
                 padding: const EdgeInsets.symmetric(horizontal: 20),

                 child: Row( children: [
                  
                                         // Left Side Contributes (40%) of the Widget Horizontally.
                                         Expanded(flex: 4, /* 40% width */
                                                       child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                                 Image.asset('assets/cartender.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Max', style: TextStyle( fontSize: 16, 
                                                                                                                           
                                                                                                                           fontWeight: FontWeight.bold, 
                                                                                                                           
                                                                                                                           color: Colors.black
                                                                                                                         
                                                                                                                          ),
                                                                                             ),

                                                                                ],

                                                                    ),

                                                      ),

                                         // Right Side Contributes (60%) of the Widget Horizontally.
                                        Expanded(flex: 6, /* 60% width */
                                         
                                                 child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            
                                                               crossAxisAlignment: CrossAxisAlignment.start,
                                            
                                                               children: [
                                             
                                                                           // Dropdown list for working hours
                                                                           DropdownButton<String>(isExpanded: true,
                                                                                                  
                                                                                                  underline: Container(), // Removes underline
                                                                                                 
                                                                                                  style: const TextStyle(fontSize: 16, color: Colors.black), // Style for dropdown text
                                                                                             
                                                                                                  hint: const Row( children: [ Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                              
                                                                                                                               SizedBox(width: 8),
                                                                                                                          
                                                                                                                               Text('Working Hours'),
                                                                                                                              ],
                                                                                                                  ),
                                             
                                                                                                  items: <String>[
                                                 
                                                                                                                    'Sunday - 9:00 - 17:00',
                                                                                                                    'Monday - 9:00 - 17:00',
                                                                                                                    'Tuesday - 12:00 - 17:00',
                                                                                                                    'Wednesday - 12:00 - 17:00',
                                                                                                                                            
                                                                                                                    
                                                                   
                                                                                                                  ].map((String value) {
                                                                                     
                                                                                                                                        return DropdownMenuItem<String>(value: value, child: Text(value));
                                                                                                                                       
                                                                                                                                       }).toList(),
                                                                                                  onChanged: (String? newValue) { /* Handle dropdown selection */ },
                                                                                                ),
                            
                                                                            // Text for hourly rate
                                                                            const Text('8\$ per hour', 
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                                                       
                                                                                       ),
                            
                            
                                                                           // Text for phone number
                                                                           const Text('+964 770 590 6860',
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                             fontWeight: FontWeight.w500, 
                                                                             color: Colors.black
                                                                            )
                                                                                                         
                                                                                      ),
                                            ],
                                          ),
                                        ),
          ],
        ),
      ),
      
     

      // Second Widget
      Container( margin: const EdgeInsets.symmetric(vertical: 15),

                 height: MediaQuery.of(context).size.height * 0.3,

                 width: double.infinity,

                 decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15) /* Curved edges*/ ),
      
                 padding: const EdgeInsets.symmetric(horizontal: 20),

                 child: Row( children: [
                  
                                         // Left Side Contributes (40%) of the Widget Horizontally.
                                         Expanded(flex: 4, /* 40% width */
                                                       child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                                 Image.asset('assets/cartender.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                               const  SizedBox(height: 10),

                                                                               const  Text('Leonardo',
                                                                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                                                     ),

                                                                                 ],

                                                                    ),

                                                      ),

                                         // Right Side Contributes (60%) of the Widget Horizontally.
            Expanded(flex: 6, /* 60% width */
             
                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                                   crossAxisAlignment: CrossAxisAlignment.start,
                
                                   children: [
                 
                                               // Dropdown list for working hours
                                               DropdownButton<String>(isExpanded: true,
                                                                      
                                                                      underline: Container(), // Removes underline
                                                                     
                                                                      style: const TextStyle(fontSize: 16, color: Colors.black), // Style for dropdown text
                                                                 
                                                                      hint: const Row( children: [ Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                  
                                                                                                   SizedBox(width: 8),
                                                                                              
                                                                                                   Text('Working Hours'),
                                                                                                  ],
                                                                                      ),
                 
                                                                      items: <String>[
                     
                                                                                        
                                                                                        'Tuesday - 9:00 - 17:00',
                                                                                        'Wednesday - 9:00 - 17:00',
                                                                                        'Thursday - 9:00 - 17:00',                        
                                                                                        
                                       
                                                                                      ].map((String value) {
                                                         
                                                                                                            return DropdownMenuItem<String>(value: value, child: Text(value));
                                                                                                           
                                                                                                           }).toList(),
                                                                      onChanged: (String? newValue) { /* Handle dropdown selection */ },
                                                                    ),

                                                // Text for hourly rate
                                                const Text('5\$ per hour', 
                                                           
                                                           style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                           
                                                           ),


                                               // Text for phone number
                                               const Text('+964 772 340 4090',
                                                           
                                                           style: TextStyle( fontSize: 16, 
                                                                             fontWeight: FontWeight.w500, 
                                                                             color: Colors.black
                                                                            )
                                                                             
                                                          ),
                ],
              ),
            ),
          ],
        ),
      ),



     //Third Widget
     Container( margin: const EdgeInsets.symmetric(vertical: 15),

                 height: MediaQuery.of(context).size.height * 0.3,

                 width: double.infinity,

                 decoration: BoxDecoration(color: const Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15) /* Curved edges*/ ),
      
                 padding: const EdgeInsets.symmetric(horizontal: 20),

                 child: Row( children: [
                  
                                         // Left Side Contributes (40%) of the Widget Horizontally.
                                         Expanded(flex: 4, /* 40% width */
                                                       child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                                 Image.asset('assets/cartender.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Marc', style: TextStyle( fontSize: 16, 
                                                                                                                           
                                                                                                                           fontWeight: FontWeight.bold, 
                                                                                                                           
                                                                                                                           color: Colors.black
                                                                                                                         
                                                                                                                          ),
                                                                                             ),

                                                                                ],

                                                                    ),

                                                      ),

                                         // Right Side Contributes (60%) of the Widget Horizontally.
                                        Expanded(flex: 6, /* 60% width */
                                         
                                                 child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            
                                                               crossAxisAlignment: CrossAxisAlignment.start,
                                            
                                                               children: [
                                             
                                                                           // Dropdown list for working hours
                                                                           DropdownButton<String>(isExpanded: true,
                                                                                                  
                                                                                                  underline: Container(), // Removes underline
                                                                                                 
                                                                                                  style: const TextStyle(fontSize: 16, color: Colors.black), // Style for dropdown text
                                                                                             
                                                                                                  hint: const Row( children: [ Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                              
                                                                                                                               SizedBox(width: 8),
                                                                                                                          
                                                                                                                               Text('Working Hours'),
                                                                                                                              ],
                                                                                                                  ),
                                             
                                                                                                  items: <String>[
                                                 
                                                                                                                    'Saturday - 11:00 - 17:00',
                                                                                                                    'Sunday - 9:00 - 17:00',
                                                                                                                    'Monday - 9:00 - 17:00',
                                                                                                                    'Tuesday - 12:00 - 17:00',
                                                                                                                    'Wednesday - 12:00 - 17:00',
                                                                                                                                            
                                                                                                                    
                                                                   
                                                                                                                  ].map((String value) {
                                                                                     
                                                                                                                                        return DropdownMenuItem<String>(value: value, child: Text(value));
                                                                                                                                       
                                                                                                                                       }).toList(),
                                                                                                  onChanged: (String? newValue) { /* Handle dropdown selection */ },
                                                                                                ),
                            
                                                                            // Text for hourly rate
                                                                            const Text('6\$ per hour', 
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                                                       
                                                                                       ),
                            
                            
                                                                           // Text for phone number
                                                                           const Text('+964 774 447 8188',
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                             fontWeight: FontWeight.w500, 
                                                                             color: Colors.black
                                                                            )
                                                                                                         
                                                                                      ),
                                            ],
                                          ),
                                        ),
          ],
        ),
      ),
      

      

   
   
   
    ],
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



}//closing bracket of the Scaffold.


}//closing bracket of the PlumberScreen class.
