import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Request extends StatefulWidget {
  final String email;

  const Request({required this.email, super.key});

  @override
  RequestStatus createState() => RequestStatus();
}

class RequestStatus extends State<Request> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> _fetchUserRequests() async {
   
    String? userId = await _getUserId(widget.email);
    
    if (userId == null) return [];
   
    QuerySnapshot querySnapshot = await _firestore
       
        .collection('requests')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs;
  }

  Future<String?> _getUserId(String email) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('Email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id; // Retrieve the document ID (user_id).
      } else {
        return null; // User not found.
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error retrieving user ID: $error')),
      );
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    
  return Scaffold(
      
      appBar: AppBar(
        title: const Text('Request Status'),
      ),
     
     
      body: SingleChildScrollView( child: Column( children: [
           
            FutureBuilder<List<QueryDocumentSnapshot>>(
              
              future: _fetchUserRequests(),
             
              builder: (context, snapshot) {
               
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Error loading requests: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No requests found'));
                }

                final requests = snapshot.data!;
                return Column( children: requests.map((doc) {
                    
                               final request = doc.data() as Map<String, dynamic>;

                              return Container( margin: const EdgeInsets.symmetric(vertical: 10),
                     
                                               padding: const EdgeInsets.all(15),
                     
                                               width: double.infinity,
                      
                                              decoration: BoxDecoration( color: const Color(0xFFB3C8CF),
                                                                         borderRadius: BorderRadius.circular(10),
                                                                        ),
                      
                                             child: Row( children: [
                                                                     Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Labour Name: ${request['labour_name'] ?? 'No name'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Phone Number: ${request['phone_no'] ?? 'No Telephone'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Reserved Time: ${request['reserved_time'] ?? 'No reserved time'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Wage per Hour: ${request['wage_per_hour'] ?? 'No wage '}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                         
                                                                     Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status: ${request['request_status'] ?? 'No Status'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFE82561)),
                                ),
                              ],
                            ),
                          ),
                        
                                                                   ],

                                                        ),

                                           );

                  }).toList(),

                );

              },

            ),

          ],

        ),


      ),
     
     
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        child: SizedBox(height: 40),
      ),
     
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Return to Primary screen
        },
        child: const Icon(Icons.home),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
