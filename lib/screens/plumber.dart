import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/primary_screen/primary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Plumber extends StatefulWidget{

final String email;

const Plumber({required this.email, super.key});



@override
PlumberScreen createState() => PlumberScreen();

}//closing bracket of the Plumber class.




class PlumberScreen extends State<Plumber> {

 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  String? selectedWorkingHours1;
  String? selectedWorkingHours2;
  String? selectedWorkingHours3;
  String? selectedWorkingHours4;

  String? selectedWorkingHours;
 


 late String userEmail; // Declare a variable to hold the email

  @override
  void initState() {
    super.initState();
    userEmail = widget.email; // Save the email to another variable
  }




  Future<String?> _getUserId() async {
    try {
      // Query the users collection to get the document ID based on email.
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('Email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id; // Retrieve the document ID (user_id).
      } else {
        return null; // User not found.
      }
    } catch (error) {
      // Handle any errors while fetching the user ID.
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error retrieving user ID: $error')),
      );
      return null;
    }
  }

  Future<void> _handleSelect(String laborName, String wagePerHour, String laborPhoneNo, String labourEmail) async {


 if(selectedWorkingHours1 != null){ selectedWorkingHours = selectedWorkingHours1;}
     if(selectedWorkingHours2 != null){ selectedWorkingHours = selectedWorkingHours2;}
     if(selectedWorkingHours3 != null){ selectedWorkingHours = selectedWorkingHours3;}
     if(selectedWorkingHours4 != null){ selectedWorkingHours = selectedWorkingHours4;}

var status = 'Proceeding';

    try {
      
      if (selectedWorkingHours == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select working hours!')),
        );
        return;
      }

      // Retrieve the user_id.
      String? userId = await _getUserId();
      if (userId == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found!')),
        );
        return;
      }

  
      // Add data to the 'requests' collection.
      await _firestore.collection('requests').add({
        'user_id': userId, // Include the user_id in the request data.
        'labour_name': laborName,
        'reserved_time': selectedWorkingHours,
        'wage_per_hour': wagePerHour,
        'phone_no': laborPhoneNo,
        'request_status': status,
        'labour_email': labourEmail,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request submitted successfully!', style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,),
      );

      // Navigate back
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit request: $error')),
      );
    }
  }





@override
Widget build(BuildContext context){

return Scaffold( body: SingleChildScrollView(
                      
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
                                                                                 Image.asset('assets/plumber.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Jack', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                                            DropdownButton<String>( isExpanded: true,
                                                                                                    
                                                                                                     underline: Container(),
                                                                                                     
                                                                                                     style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                                                    
                                                                                                     hint: selectedWorkingHours1 == null
                                                                                                         ? const Row(
                                                                                                                      children: [
                                                                                                                                  Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                       
                                                                                                                                  SizedBox(width: 8),
                                                                                                                        
                                                                                                                                  Text('Working Hours'),
                                                                                                                                ],
                                                                                                               
                                                                                                                    ) : null, // Remove the hint when an item is selected
                                                                                                     
                                                                                                     value: selectedWorkingHours1, // Bind the selected value
                                                                                                     
                                                                                                     items: <String>[
              
                                                                                                                    'Sunday - 7:00 - 12:00',
                                                                                                                    'Monday - 7:00 - 12:00',
                                                                                                                    'Tuesday - 7:00 - 12:00',
                                                                                                                    'Wednesday - 9:00 - 17:00',
                                                                                                     
                                                                                                                    ].map((String value1) { return DropdownMenuItem<String>(value: value1, child: Text(value1) ); }).toList(),
                                                                                                    
                                                                                                     onChanged: (String? newValue1) { setState( () { selectedWorkingHours1 = newValue1; /* Update the selected item*/ } ); },
                                   
                                                                                                    ),
                            
                                                                            // Text for hourly rate
                                                                            const Text('6\$ per hour', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black ) ),
                            
                            
                                                                            // Phone number with 'Select' button
                                                                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                
                                                                                   children: [ const Text( '+964 770 730 2330', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black) ),
                                                                                  
                                                                                              // 'Select' Button
                                                                                             ElevatedButton(
                                                                                                            onPressed: () {
                                                                                                                            showDialog(
                                                                                                                                       context: context,
                                                                                                                              
                                                                                                                                       builder: (BuildContext context) {
                                                                                                                                                                        return AlertDialog( title: const Text('Confirmation'),
                                                                                                                                  
                                                                                                                                                                                            content: const Text('Are you sure you want to proceed?'),
                                                                                                                                  
                                                                                                                                                                                           actions: [
                                                                                                                                                                                                      // Cancel Button
                                                                                                                                                                                                      TextButton(onPressed: () => Navigator.of(context).pop(), /Close the modal/ child: const Text('Cancel') ),
                                                                                                                                                                                                    
                                                                                                                                                                                                      // Confirm Button
                                                                                                                                                                                                      ElevatedButton(
                                                                                                                                                                                                                      onPressed: () { 
                                                                                                                                               

                                                                                                                                                                                                                                      _handleSelect('Jack', '6\$', '+964 770 730 2330', 'jack@gmail.com'); // Call your method

                                                                                                                                                                                                                                      Navigator.of(context).pop(); // Close the modal
                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                    },
                                                                                                                                                                                                        
                                                                                                                                                                                                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                                                                                                                                                        
                                                                                                                                                                                                                      child: const Text('Confirm'),
                                                                                                                                                                                                      
                                                                                                                                                                                                                    ),
                                                                                                                                                                                                   
                                                                                                                                                                                                    ],
                                                                                                                                                                                          
                                                                                                                                                                                           );
                                                                                                                                                  
                                                                                                                                                                      }
                                                                                                                           
                                                                                                                                      );
                                                                                                                           },
  
                                                                                                            style: ElevatedButton.styleFrom( backgroundColor: Colors.red,
   
                                                                                                                                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  
                                                                                                                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                                                                            ),
 
                                                                                                            child: const Text('Select', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold) ) )
                                                                                        
                                                                                            ],
                                                                                  
                                                                                 )
 
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
                                                                                 Image.asset('assets/plumber.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                               const  SizedBox(height: 10),

                                                                               const  Text('Ahmed',
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
                                                                            DropdownButton<String>( isExpanded: true,
                                                                                                    
                                                                                                     underline: Container(),
                                                                                                     
                                                                                                     style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                                                    
                                                                                                     hint: selectedWorkingHours2 == null
                                                                                                         ? const Row(
                                                                                                                      children: [
                                                                                                                                  Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                       
                                                                                                                                  SizedBox(width: 8),
                                                                                                                        
                                                                                                                                  Text('Working Hours'),
                                                                                                                                ],
                                                                                                               
                                                                                                                    ) : null, // Remove the hint when an item is selected
                                                                                                     
                                                                                                     value: selectedWorkingHours2, // Bind the selected value
                                                                                                     
                                                                                                     items: <String>[
              
                                                                                                                    'Sunday - 7:00 - 12:00',
                                                                                                                    'Monday - 7:00 - 12:00',
                                                                                                                    'Tuesday - 7:00 - 12:00',
                                                                                                                    'Wednesday - 9:00 - 17:00',
                                                                                                     
                                                                                                                    ].map((String value2) { return DropdownMenuItem<String>(value: value2, child: Text(value2) ); }).toList(),
                                                                                                    
                                                                                                     onChanged: (String? newValue2) { setState( () { selectedWorkingHours2 = newValue2; /* Update the selected item*/ } ); },
                                   
                                                                                                    ),

                                                // Text for hourly rate
                                                const Text('7\$ per hour', 
                                                           
                                                           style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                           
                                                           ),


                                              // Phone number with 'Select' button
                                                                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              
                                                                                 children: [ const Text( '+964 770 600 1990', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black) ),
                                                                                
                                                                                             // 'Select' Button
                                                                                             ElevatedButton(
                                                                                                            onPressed: () {
                                                                                                                            showDialog(
                                                                                                                                       context: context,
                                                                                                                              
                                                                                                                                       builder: (BuildContext context) {
                                                                                                                                                                        return AlertDialog( title: const Text('Confirmation'),
                                                                                                                                  
                                                                                                                                                                                            content: const Text('Are you sure you want to proceed?'),
                                                                                                                                  
                                                                                                                                                                                           actions: [
                                                                                                                                                                                                      // Cancel Button
                                                                                                                                                                                                      TextButton(onPressed: () => Navigator.of(context).pop(), /Close the modal/ child: const Text('Cancel') ),
                                                                                                                                                                                                    
                                                                                                                                                                                                      // Confirm Button
                                                                                                                                                                                                      ElevatedButton(
                                                                                                                                                                                                                      onPressed: () { 
                                                                                                                                                                                                                                      _handleSelect('Ahmed', '7\$', '+964 770 600 1990', 'Ahmed@gmail.com'); // Call your method
                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                      Navigator.of(context).pop(); // Close the modal
                                                                                                                                                                                                                                    },
                                                                                                                                                                                                        
                                                                                                                                                                                                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                                                                                                                                                        
                                                                                                                                                                                                                      child: const Text('Confirm'),
                                                                                                                                                                                                      
                                                                                                                                                                                                                    ),
                                                                                                                                                                                                   
                                                                                                                                                                                                    ],
                                                                                                                                                                                          
                                                                                                                                                                                           );
                                                                                                                                                  
                                                                                                                                                                      }
                                                                                                                           
                                                                                                                                      );
                                                                                                                           },
  
                                                                                                            style: ElevatedButton.styleFrom( backgroundColor: Colors.red,
   
                                                                                                                                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  
                                                                                                                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                                                                            ),
 
                                                                                                            child: const Text('Select', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold) ) )
                                                                                      
                                                                                          ],
                                                                                
                                                                               )
 
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
                                                                                 Image.asset('assets/plumber.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Dwayson', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                                            DropdownButton<String>( isExpanded: true,
                                                                                                    
                                                                                                     underline: Container(),
                                                                                                     
                                                                                                     style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                                                    
                                                                                                     hint: selectedWorkingHours3 == null
                                                                                                         ? const Row(
                                                                                                                      children: [
                                                                                                                                  Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                       
                                                                                                                                  SizedBox(width: 8),
                                                                                                                        
                                                                                                                                  Text('Working Hours'),
                                                                                                                                ],
                                                                                                               
                                                                                                                    ) : null, // Remove the hint when an item is selected
                                                                                                     
                                                                                                     value: selectedWorkingHours3, // Bind the selected value
                                                                                                     
                                                                                                     items: <String>[
              
                                                                                                                    'Sunday - 7:00 - 12:00',
                                                                                                                    'Monday - 7:00 - 12:00',
                                                                                                                    'Tuesday - 7:00 - 12:00',
                                                                                                                    'Wednesday - 9:00 - 17:00',
                                                                                                     
                                                                                                                    ].map((String value3) { return DropdownMenuItem<String>(value: value3, child: Text(value3) ); }).toList(),
                                                                                                    
                                                                                                     onChanged: (String? newValue3) { setState( () { selectedWorkingHours3 = newValue3; /* Update the selected item*/ } ); },
                                   
                                                                                                    ),
                            
                                                                            // Text for hourly rate
                                                                            const Text('3\$ per hour', 
                                                                                       
                                                                                       style: TextStyle( fontSize: 16, 
                                                                            
                                                                             fontWeight: FontWeight.w500, 
                                                                            
                                                                             color: Colors.black
                                                                           )
                                                                                       
                                                                                       ),
                            
                            
                                                                           // Phone number with 'Select' button
                                                                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              
                                                                                 children: [ const Text( '+964 770 790 0190', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black) ),
                                                                                
                                                                                            // 'Select' Button
                                                                                             ElevatedButton(
                                                                                                            onPressed: () {
                                                                                                                            showDialog(
                                                                                                                                       context: context,
                                                                                                                              
                                                                                                                                       builder: (BuildContext context) {
                                                                                                                                                                        return AlertDialog( title: const Text('Confirmation'),
                                                                                                                                  
                                                                                                                                                                                            content: const Text('Are you sure you want to proceed?'),
                                                                                                                                  
                                                                                                                                                                                           actions: [
                                                                                                                                                                                                      // Cancel Button
                                                                                                                                                                                                      TextButton(onPressed: () => Navigator.of(context).pop(), /Close the modal/ child: const Text('Cancel') ),
                                                                                                                                                                                                    
                                                                                                                                                                                                      // Confirm Button
                                                                                                                                                                                                      ElevatedButton(
                                                                                                                                                                                                                      onPressed: () { 
                                                                                                                                                                                                                                      _handleSelect('Dwayson', '3\$', '+964 770 790 0190', 'Dwayson@gmail.com'); // Call your method
                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                      Navigator.of(context).pop(); // Close the modal
                                                                                                                                                                                                                                    },
                                                                                                                                                                                                        
                                                                                                                                                                                                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                                                                                                                                                        
                                                                                                                                                                                                                      child: const Text('Confirm'),
                                                                                                                                                                                                      
                                                                                                                                                                                                                    ),
                                                                                                                                                                                                   
                                                                                                                                                                                                    ],
                                                                                                                                                                                          
                                                                                                                                                                                           );
                                                                                                                                                  
                                                                                                                                                                      }
                                                                                                                           
                                                                                                                                      );
                                                                                                                           },
  
                                                                                                            style: ElevatedButton.styleFrom( backgroundColor: Colors.red,
   
                                                                                                                                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  
                                                                                                                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                                                                            ),
 
                                                                                                            child: const Text('Select', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold) ) )
                                                                                      
                                                                                          ],
                                                                                
                                                                               )
 
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
                                                                                 Image.asset('assets/plumber.png', // Path to your asset
                                                                                                           
                                                                                                         //  fit: BoxFit.cover, // Adjusts how the image fits in the available space
                                                                                                           
                                                                                                           width: 50, // Adjust width
                                                                                                           
                                                                                                           height: 50, // Adjust height
                                                                                                         
                                                                                                         ),
                                                                                 
                                                                                 const SizedBox(height: 10),

                                                                                 const  Text('Mack', style: TextStyle( fontSize: 16, 
                                                                                                                           
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
                                                                            DropdownButton<String>( isExpanded: true,
                                                                                                    
                                                                                                     underline: Container(),
                                                                                                     
                                                                                                     style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                                                    
                                                                                                     hint: selectedWorkingHours4 == null
                                                                                                         ? const Row(
                                                                                                                      children: [
                                                                                                                                  Icon(Icons.schedule, size: 20, color: Colors.black),
                                                                                                                       
                                                                                                                                  SizedBox(width: 8),
                                                                                                                        
                                                                                                                                  Text('Working Hours'),
                                                                                                                                ],
                                                                                                               
                                                                                                                    ) : null, // Remove the hint when an item is selected
                                                                                                     
                                                                                                     value: selectedWorkingHours4, // Bind the selected value