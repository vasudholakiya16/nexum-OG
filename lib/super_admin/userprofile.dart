import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late Future<Map<String, dynamic>> userData;

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User is not logged in");
      }

      // Fetch data from Firestore based on UID
      final snapshot = await FirebaseFirestore.instance
          .collection('all_clubs')
          .where('uid', isEqualTo: user.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data();
      } else {
        throw Exception("No user data found");
      }
    } catch (e) {
      throw Exception("Error fetching user data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    userData = fetchUserData(); // Initiate fetching of user data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found.'));
          } else {
            final data = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${data['name']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email: ${data['email']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Club Type: ${data['clubType']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
