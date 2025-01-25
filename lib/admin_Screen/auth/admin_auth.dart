// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // import '../admin_Home_Page.dart/home_screen_admin.dart';

// // class AdminLoginScreen extends StatefulWidget {
// //   const AdminLoginScreen({super.key});

// //   @override
// //   State<AdminLoginScreen> createState() => _AdminLoginScreenState();
// // }

// // class _AdminLoginScreenState extends State<AdminLoginScreen> {
// //   bool _isPasswordVisible =
// //       false; // State variable to toggle password visibility
// //   TextEditingController emailController =
// //       TextEditingController(text: 'vvvaassuu@gmail.com');
// //   TextEditingController passwordController =
// //       TextEditingController(text: '123456');
// //   void loginUser() async {
// //     final String email = emailController.text.trim();
// //     final String password = passwordController.text.trim();

// //     if (email.isEmpty || password.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please fill in all fields.')),
// //       );
// //       return;
// //     }

// //     try {
// //       // Query Firestore to check if a user exists with the entered email and password
// //       final snapshot = await FirebaseFirestore.instance
// //           .collection('all_clubs')
// //           .where('email', isEqualTo: email)
// //           .where('password', isEqualTo: password)
// //           .get();

// //       if (snapshot.docs.isNotEmpty) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Login successful!')),
// //         );
// //         // Navigate to the home screen or dashboard (Implement your navigation logic here)
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Invalid email or password.')),
// //         );
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error during login: $e')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final mediaQuery = MediaQuery.of(context);
// //     final screenWidth = mediaQuery.size.width;
// //     return Scaffold(
// //       backgroundColor: const Color(0xffFFFCEF),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.only(top: mediaQuery.size.height * 0.2),
// //           child: Column(
// //             children: [
// //               Image.asset(
// //                 'assets/images/thumbnil.png',
// //               ),
// //               const Center(
// //                 child: Text(
// //                   'Login',
// //                   style: TextStyle(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(
// //                 height: 20,
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Container(
// //                   width: screenWidth * 0.9,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     border: const Border(
// //                       top: BorderSide(color: Colors.black, width: 1),
// //                       left: BorderSide(color: Colors.black, width: 1),
// //                       right: BorderSide(color: Colors.black, width: 5),
// //                       bottom: BorderSide(color: Colors.black, width: 4),
// //                     ),
// //                   ),
// //                   child: TextFormField(
// //                     controller: emailController,
// //                     decoration: const InputDecoration(
// //                       hintText: 'Email',
// //                       border: InputBorder.none,
// //                       prefixIcon: Icon(Icons.email),
// //                       contentPadding: EdgeInsets.symmetric(vertical: 20),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Container(
// //                   width: screenWidth * 0.9,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     border: const Border(
// //                       top: BorderSide(color: Colors.black, width: 1),
// //                       left: BorderSide(color: Colors.black, width: 1),
// //                       right: BorderSide(color: Colors.black, width: 5),
// //                       bottom: BorderSide(color: Colors.black, width: 4),
// //                     ),
// //                   ),
// //                   child: TextFormField(
// //                     controller: passwordController,
// //                     obscureText:
// //                         !_isPasswordVisible, // Toggle password visibility
// //                     decoration: InputDecoration(
// //                       hintText: 'Password',
// //                       border: InputBorder.none,
// //                       prefixIcon: const Icon(Icons.lock),
// //                       contentPadding: const EdgeInsets.symmetric(vertical: 20),
// //                       suffixIcon: IconButton(
// //                         icon: Icon(
// //                           _isPasswordVisible
// //                               ? Icons.visibility
// //                               : Icons.visibility_off,
// //                         ),
// //                         onPressed: () {
// //                           setState(() {
// //                             _isPasswordVisible = !_isPasswordVisible;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                     loginUser();
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => AdminHome()));
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.black,
// //                     padding: const EdgeInsets.symmetric(
// //                       horizontal: 50,
// //                       vertical: 15,
// //                     ),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     'Login',
// //                     style: TextStyle(color: Colors.white, fontSize: 18),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

// import '../admin_Home_Page.dart/home_screen_admin.dart'; // Your home page

// class AdminLoginScreen extends StatefulWidget {
//   const AdminLoginScreen({super.key});

//   @override
//   State<AdminLoginScreen> createState() => _AdminLoginScreenState();
// }

// class _AdminLoginScreenState extends State<AdminLoginScreen> {
//   bool _isPasswordVisible =
//       false; // State variable to toggle password visibility
//   TextEditingController emailController =
//       TextEditingController(text: 'vasduete@gmail.com');
//   TextEditingController passwordController =
//       TextEditingController(text: '123654789');

//   void loginUser() async {
//     final String email = emailController.text.trim();
//     final String password = passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill in all fields.')),
//       );
//       return;
//     }

//     try {
//       // Query Firestore to check if a user exists with the entered email and password
//       final snapshot = await FirebaseFirestore.instance
//           .collection('all_clubs')
//           .where('email', isEqualTo: email)
//           .where('password', isEqualTo: password)
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Login successful!')),
//         );

//         // Store the login status in SharedPreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true); // Set isLoggedIn flag to true

//         // Navigate to the home screen or dashboard after successful login
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => AdminHome()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid email or password.')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error during login: $e')),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   // Check if the user is logged in
//   void checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//     if (isLoggedIn) {
//       // If already logged in, navigate to the home screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => AdminHome()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;

//     return Scaffold(
//       backgroundColor: const Color(0xffFFFCEF),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: mediaQuery.size.height * 0.2),
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/images/thumbnil.png', // Your thumbnail image
//               ),
//               const Center(
//                 child: Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: screenWidth * 0.9,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: const Border(
//                       top: BorderSide(color: Colors.black, width: 1),
//                       left: BorderSide(color: Colors.black, width: 1),
//                       right: BorderSide(color: Colors.black, width: 5),
//                       bottom: BorderSide(color: Colors.black, width: 4),
//                     ),
//                   ),
//                   child: TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       hintText: 'Email',
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.email),
//                       contentPadding: EdgeInsets.symmetric(vertical: 20),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: screenWidth * 0.9,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: const Border(
//                       top: BorderSide(color: Colors.black, width: 1),
//                       left: BorderSide(color: Colors.black, width: 1),
//                       right: BorderSide(color: Colors.black, width: 5),
//                       bottom: BorderSide(color: Colors.black, width: 4),
//                     ),
//                   ),
//                   child: TextFormField(
//                     controller: passwordController,
//                     obscureText:
//                         !_isPasswordVisible, // Toggle password visibility
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       border: InputBorder.none,
//                       prefixIcon: const Icon(Icons.lock),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 20),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     loginUser(); // This will now only navigate on success
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 50,
//                       vertical: 15,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin_Screen/admin_Home_Page.dart/admin_Home_Page.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  bool _isPasswordVisible =
      false; // State variable to toggle password visibility
  TextEditingController emailController =
      TextEditingController(text: 'vasduete@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123654789');

  void loginUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    try {
      // Query Firestore to check if a user exists with the entered email and password
      final snapshot = await FirebaseFirestore.instance
          .collection('all_clubs')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (snapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        // Store the login status in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true); // Set isLoggedIn flag to true

        // Navigate to the home screen or dashboard after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during login: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  // Check if the user is logged in
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // If already logged in, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFCEF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: mediaQuery.size.height * 0.2),
          child: Column(
            children: [
              Image.asset(
                'assets/images/thumbnil.png', // Your thumbnail image
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: const Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 5),
                      bottom: BorderSide(color: Colors.black, width: 4),
                    ),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: const Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 5),
                      bottom: BorderSide(color: Colors.black, width: 4),
                    ),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText:
                        !_isPasswordVisible, // Toggle password visibility
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.lock),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    loginUser(); // This will now only navigate on success
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
