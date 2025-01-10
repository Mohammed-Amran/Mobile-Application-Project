import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/primary_screen/primary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget {
  final String email;

  const History({required this.email, super.key});

  @override
  HistoryView createState() => HistoryView();
}

class HistoryView extends State<History> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to retrieve the UserId using email.
  Future<String?> _getUserId(String email) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('Email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id; // Retrieve the document ID (user_id)
      } else {
        return null; // User not found
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error retrieving user ID: $error')),
      );
      return null;
    }
  }

  Stream<QuerySnapshot>? _getUserRequests(String email) async* {
    String? userId = await _getUserId(email);

    if (userId != null) {
      yield* _firestore
          .collection('requests')
          .where('user_id', isEqualTo: userId)
          .snapshots();
    }
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
      MaterialPageRoute(builder: (context) => Primary(email: widget.email)),
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
    _checkFavoriteStatus();
  }

  // Check if the request is marked as favorite
  Future<void> _checkFavoriteStatus() async {
    final firestore = FirebaseFirestore.instance;

    final querySnapshot = await firestore
        .collection('favourites')
        .where('request_id', isEqualTo: widget.requestId)
        .where('user_email', isEqualTo: widget.email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  // Toggle favorite status
  Future<void> _toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    final firestore = FirebaseFirestore.instance;

    if (isFavorite) {
      // Add to favorites
      await firestore.collection('favourites').add({
        'user_email': widget.email,
        'labour_name': widget.request['labour_name'],
        'phone_no': widget.request['phone_no'],
        'reserved_time': widget.request['reserved_time'],
        'wage_per_hour': widget.request['wage_per_hour'],
        'timestamp': widget.request['timestamp'],
        'request_id': widget.requestId,
      });
    } else {
      // Remove from favorites
      final querySnapshot = await firestore
          .collection('favourites')
          .where('request_id', isEqualTo: widget.requestId)
          .where('user_email', isEqualTo: widget.email)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    }
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
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.yellow : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}