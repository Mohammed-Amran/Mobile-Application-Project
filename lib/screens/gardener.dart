import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/primary_screen/primary.dart';

class Gardener extends StatefulWidget{

const Gardener({super.key});

@override
GardenerScreen createState() => GardenerScreen();

}



class GardenerScreen extends State<Gardener> {



@override
Widget build(BuildContext context){

return  Scaffold(

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
                                                                                 Image.asset('assets/gardener.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Carvajal', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                                                                                    'Wednesday - 12:00 - 17:00',
                                                                                                                                            
                                                                                                                    
                                                                   
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
                                                                           const Text('+964 751 171 2930',
                                                                                       
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
                                                                                 Image.asset('assets/gardener.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                               const  SizedBox(height: 10),

                                                                               const  Text('Ali',
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
                     
                                                                                        'Sunday - 9:00 - 17:00',
                                                                                        'Monday - 9:00 - 17:00',
                                                                                        'Tuesday - 9:00 - 17:00',
                                                                                        'Wednesday - 9:00 - 17:00',
                                                                                        'Thursday - 9:00 - 17:00',                        
                                                                                        'Friday - 9:00 - 17:00',
                                       
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
                                               const Text('+964 771 437 4799',
                                                           
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
                                                                                 Image.asset('assets/gardener.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Alonso', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                                            const Text('5\$ per hour', 
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                                                       
                                                                                       ),
                            
                            
                                                                           // Text for phone number
                                                                           const Text('+964 771 170 7770',
                                                                                       
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
      


      //4th Widget
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
                                                                                 Image.asset('assets/gardener.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Sara', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                 
                                                                                                                    'Sunday - 7:00 - 12:00',
                                                                                                                    'Monday - 7:00 - 12:00',
                                                                                                                    'Tuesday - 7:00 - 12:00',
                                                                                                                    'Wednesday - 9:00 - 17:00',
                                                                                                                                            
                                                                                                                    
                                                                   
                                                                                                                  ].map((String value) {
                                                                                     
                                                                                                                                        return DropdownMenuItem<String>(value: value, child: Text(value));
                                                                                                                                       
                                                                                                                                       }).toList(),
                                                                                                  onChanged: (String? newValue) { /* Handle dropdown selection */ },
                                                                                                ),
                            
                                                                            // Text for hourly rate
                                                                            const Text('4\$ per hour', 
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                                                       
                                                                                       ),
                            
                            
                                                                           // Text for phone number
                                                                           const Text('+964 770 506 2290',
                                                                                       
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
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   


);



}//closing bracket of the Scaffold.


}//closing bracket of the PlumberScreen class.

