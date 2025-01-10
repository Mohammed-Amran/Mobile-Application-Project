// implemented by banw
import 'package:flutter/material.dart';
import 'package:support_for_better_livingspace/primary_screen/primary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cartender.dart';
import 'gardener.dart';
import 'electrician.dart';
import 'plumber.dart';

class Favourite extends StatefulWidget {
  final String email;

  const Favourite({required this.email, super.key});

  @override
  FavouriteView createState() => FavouriteView();
}

class FavouriteView extends State<Favourite> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Map<String, bool> favoriteStatus = {}; // Cache to preserve favorite status

  Stream<QuerySnapshot> _getUserFavourites(String email) {
    return _firestore
        .collection('favourites')
        .where('user_email', isEqualTo: email)
        .snapshots();
  }

  void _navigateToLabourScreen(BuildContext context, String labourName) {
    switch (labourName) {
      case 'Jack':
      case 'Ahmed':
      case 'Dwayson':
      case 'Mack':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Plumber(email: widget.email)),
        );
        break;
      case 'Arda':
      case 'Ozil':
      case 'Metin':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Electrician(email: widget.email)),
        );
        break;
      case 'Carvajal':
      case 'Ali':
      case 'Alonso':
      case 'Sam':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gardener(email: widget.email)),
        );
        break;
      case 'Max':
      case 'Leonardo':
      case 'Marc':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cartender(email: widget.email)),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No matching labour screen found.')),
        );
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _getUserFavourites(widget.email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading favourites'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No favourites found'));
                }

                final favourites = snapshot.data!.docs;

                return Column(
                  children: favourites.map((doc) {
                    final favourite = doc.data() as Map<String, dynamic>;
                    final labourName = favourite['labour_name'] ?? 'Unknown';
                    

                   

                    return GestureDetector(
                      onTap: () => _navigateToLabourScreen(context, labourName),
                      child: Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Labour Name: $labourName',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Phone Number: ${favourite['phone_no'] ?? 'No Telephone'}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Reserved Time: ${favourite['reserved_time'] ?? 'No reserved time'}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Wage per Hour: ${favourite['wage_per_hour'] ?? 'No wage'}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Primary(email: ''),
            ),
          );
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}