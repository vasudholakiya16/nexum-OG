import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin_Screen/auth/admin_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late Future<Map<String, dynamic>> userData;
  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      // Assuming that the user is logged in and the UID is available
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
    void logout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', false); // Set isLoggedIn flag to false

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AdminLoginScreen()), // Redirect to login page
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFFFCEF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
