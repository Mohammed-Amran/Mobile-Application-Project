import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/labour/labour.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class LabourHistory extends StatefulWidget {
  final String email;

  const LabourHistory({required this.email, super.key});

  @override
  LabourHistoryView createState() => LabourHistoryView();
}

class LabourHistoryView extends State<LabourHistory> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
 

  Stream<QuerySnapshot>? _getUserRequests(String email) async* {
    

    yield* _firestore
        .collection('requests')
        .where('labour_email', isEqualTo: email)
        .where('request_status', isEqualTo: 'Done') // Filter by status 'Done'
        .snapshots();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _getUserRequests(widget.email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading requests'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No requests found'));
                }

                final requests = snapshot.data!.docs;

                return Column(
                  children: requests.map((doc) {
                    final request = doc.data() as Map<String, dynamic>;
                    final requestId = doc.id;

                    return RequestContainer(
                      email: widget.email,
                      requestId: requestId,
                      request: request,
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Labour(email: widget.email)),
          );
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class RequestContainer extends StatefulWidget {
  final String email;
  final String requestId;
  final Map<String, dynamic> request;

  const RequestContainer({
    super.key,
    required this.email,
    required this.requestId,
    required this.request,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RequestContainerState createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFB3C8CF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Labour Name: ${widget.request['labour_name'] ?? 'No name'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Phone Number: ${widget.request['phone_no'] ?? 'No Telephone'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Reserved Time: ${widget.request['reserved_time'] ?? 'No reserved time'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Wage per Hour: ${widget.request['wage_per_hour'] ?? 'No wage'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Date of Request: ${widget.request['timestamp'] != null ? (widget.request['timestamp'] as Timestamp).toDate().toString() : 'No time'}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}