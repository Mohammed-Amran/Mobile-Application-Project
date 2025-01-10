//This is the labour view
import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/labour/labour_history.dart';
import 'package:support_for_better_livingspace/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Labour extends StatefulWidget {
  final String email; // Receive the email from the previous screen

  const Labour({super.key, required this.email});

  @override
  LabourScreen createState() => LabourScreen();
}

class LabourScreen extends State<Labour> {

String name = '';
 String phoneNumber = '';
  List<Map<String, dynamic>> requests = [];
  Map<String, Map<String, String>> userDetails = {}; // Cache for user details

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchRequestsData();
  }

  Future<void> fetchUserData() async {
    final firestore = FirebaseFirestore.instance;

    try {
      final querySnapshot = await firestore
          .collection('labours')
          .where('Email', isEqualTo: widget.email) // Use the email
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        setState(() {
          name = userData['FullName'] ?? 'No Name';
          phoneNumber = userData['Phone'] ?? 'No Phone';
        });
      }
    } catch (e) {
      // Handle errors here
    }
  }


  Future<void> fetchRequestsData() async {
   
    final firestore = FirebaseFirestore.instance;

   

    try {
      final querySnapshot = await firestore
          .collection('requests')
          .where('labour_email', isEqualTo: widget.email) // Use the labour's email
          .get();

      List<Map<String, dynamic>> fetchedRequests = querySnapshot.docs.map((doc) {
       
        final data = doc.data();
        
        data['id'] = doc.id; // Include the document ID
       
        data['status'] = data['request_status'] ?? 'Pending'; // Add status field
        
        return data;
     
      }).toList();


       // Filter out requests with status 'Done'
    fetchedRequests = fetchedRequests.where((request) => request['status'] != 'Done').toList();

      // Fetch user details for each request
      for (var request in fetchedRequests) {
        String userId = request['user_id'] ?? '';
        if (userId.isNotEmpty && !userDetails.containsKey(userId)) {
          await fetchUserDetails(userId);
        }
      }

      setState(() {
        requests = fetchedRequests;
      });
    } catch (e) {
      // Handle errors here
    }
  }

  Future<void> fetchUserDetails(String userId) async {
    final firestore = FirebaseFirestore.instance;

    try {
      final docSnapshot = await firestore.collection('users').doc(userId).get();

      if (docSnapshot.exists) {
        final userData = docSnapshot.data();
        if (userData != null) {
          setState(() {
            userDetails[userId] = {
              'name': userData['FullName'] ?? 'Unknown',
              'phone': userData['Phone'] ?? 'Unknown',
            };
          });
        }
      }
    } catch (e) {
      // Handle errors here
    }
  }

  Future<void> updateRequestStatus(String requestId, String status) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('requests').doc(requestId).update({'request_status': status});
    } catch (e) {
      // Handle errors here
    }
  }


  void showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          color: const Color(0xFFB3C8CF),
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 540,
            leading: Row(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    
    
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 50),
                  Text(name, style: const TextStyle(fontSize: 18)),
                  Text(phoneNumber, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("History"),
              onTap: () { Navigator.pushAndRemoveUntil(context, 

                                                                                            MaterialPageRoute( builder: (context) => LabourHistory(email: widget.email) ),
                                                                                                           
                                                                                            (Route<dynamic> route) => false, // Clears the navigation stack
                                                                                           );},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                  (Route<dynamic> route) => false, // Clears the navigation stack
                );
              },
            ),
          ],
        ),
      ),
    
    
      body: ListView.builder( itemCount: requests.length,
       
                              itemBuilder: (context, index) {
                                                              final request = requests[index];
                                                              final userId = request['user_id'] ?? '';
                                                              final userName = userDetails[userId]?['name'] ?? 'Unknown';
                                                              final userPhone = userDetails[userId]?['phone'] ?? 'Unknown';
                                                              final reservedTime = request['reserved_time'] ?? 'No reserved time';

          return Container( margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
           
                           padding: const EdgeInsets.all(15),
           
                           decoration: BoxDecoration( color: const Color(0xFFB3C8CF),
             
                                                      borderRadius: BorderRadius.circular(10),
           
                                                    ),
           
                           child: Row( children: [ Expanded( flex: 6,
                  
                                                             child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                 
                                                                            children: [
                                                                                        Text( 'Requester Name: $userName',
                        
                                                                                               style: const TextStyle(fontSize: 14),
                                                                                             ),
                                                                              
                                                                                        Text( 'Requester Phone: $userPhone',
                        
                                                                                              style: const TextStyle(fontSize: 14),
                                                                                            ),
                                                                             
                                                                                        Text( 'Reserved Time: $reservedTime',
                                                                                          
                                                                                              style: const TextStyle(fontSize: 14),
                                                                  
                                                                                            ),
                                     
                                                                                       ],

                                                                          ),
              
                                                            ),
              
                Expanded( flex: 4,
                  
                          child: Column( mainAxisAlignment: MainAxisAlignment.center,
                   
                                         crossAxisAlignment: CrossAxisAlignment.end,
                    
                                         children: [ if (request['status'] == 'Proceeding') ...[
                       
                                                                                                ElevatedButton( onPressed: () {
                                                         showConfirmationDialog( context: context,
                             
                                                    title: 'Confirm Acceptance',
                              
                                                    message: 'Are you sure you want to accept this request?',
                             
                                                    onConfirm: () { updateRequestStatus(request['id'], 'Accepted');
                               
                                                                   setState( () { requests[index]['status'] = 'Accepted'; } );
                                                                  },
                           
                                                  );
                        
                                                      },
                         
                                        style: ElevatedButton.styleFrom( backgroundColor: Colors.green ),
                         
                                        child: const Text('Accept'),
                                 
                                      ),
                                                                                                
                                                                        
                                                                                                const SizedBox(height: 10),
                                                                                               
                                                                        
                                                                                                ElevatedButton( onPressed: () {
                                                        showConfirmationDialog( context: context,
                              
                                                    title: 'Confirm Rejection',
                                              
                                                    message: 'Are you sure you want to reject this request?',
                             
                                                    onConfirm: () { updateRequestStatus(request['id'], 'Rejected');
                                
                                                                    setState( () { requests.removeAt(index); } );
                                                                  },
                           
                                                  );
                         
                                                      },
                         
                                        style: ElevatedButton.styleFrom( backgroundColor: Colors.red ),
                          
                                        child: const Text('Reject'),
                       
                                      ),
                      
                                                                                              ]
                      
                       else if (request['status'] == 'Accepted' || request['status'] == 'On the way' || request['status'] == 'Working on it' || request['status'] == 'Done') ...[
                        DropdownButton<String>(
                          value: request['status'],
                          onChanged: (newValue) {
                            if (newValue != null) {
                              
                              updateRequestStatus(request['id'], newValue);
                              
                              setState(() {
                                 if (newValue == 'Done') {
                                                          requests.removeAt(index); // Remove the container
                                                         } 
                                 else {
                                       requests[index]['status'] = newValue;
                                      }

                              });
                            }
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'Accepted',
                              child: Text('Accepted'),
                            ),
                            DropdownMenuItem(
                              value: 'On the way',
                              child: Text('On the way'),
                            ),
                            DropdownMenuItem(
                              value: 'Working on it',
                              child: Text('Working on it'),
                            ),
                            DropdownMenuItem(
                              value: 'Done',
                              child: Text('Done'),
                              
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    
    
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ),
      
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Labour(email: '',)),
          );
        },
        child: const Icon(Icons.home),
      ),

    
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}
