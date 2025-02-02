// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/super_admin/userprofile.dart';

// import '../../splesh_screen/button.dart';

// class SignupScreenSuperAdmin extends StatefulWidget {
//   const SignupScreenSuperAdmin({super.key});

//   @override
//   State<SignupScreenSuperAdmin> createState() => _SignupScreenSuperAdminState();
// }

// class _SignupScreenSuperAdminState extends State<SignupScreenSuperAdmin> {
//   bool _isPasswordVisible = false;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String? selectedClubType;

//   void saveToFirestore() async {
//     if (selectedClubType == null || selectedClubType!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a club type.')),
//       );
//       return;
//     }

//     try {
//       // Create user in Firebase Authentication
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // Generate a unique document ID
//       final docRef = FirebaseFirestore.instance.collection('all_clubs').doc();
//       final docId = docRef.id;

//       final userData = {
//         'id': docId,
//         'uid': userCredential.user!.uid,
//         'name': nameController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//         'clubType': selectedClubType,
//       };

//       // Save to Firestore collections based on club type
//       if (selectedClubType == 'Official Club') {
//         await FirebaseFirestore.instance
//             .collection('official_clubs')
//             .doc(docId)
//             .set(userData);
//       } else if (selectedClubType == 'Unofficial Club') {
//         await FirebaseFirestore.instance
//             .collection('unofficial_clubs')
//             .doc(docId)
//             .set(userData);
//       }

//       // Save to the general "all_clubs" collection
//       await docRef.set(userData);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Signup successful!')),
//       );

//       // Clear input fields
//       nameController.clear();
//       emailController.clear();
//       passwordController.clear();
//       setState(() {
//         selectedClubType = null;
//       });

//       // Navigate to next screen after successful signup
//       print('Navigating to next screen...');
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const NextScreen()),
//       );
//     } on FirebaseAuthException catch (e) {
//       String errorMessage;
//       if (e.code == 'email-already-in-use') {
//         errorMessage = 'This email is already registered.';
//       } else if (e.code == 'weak-password') {
//         errorMessage = 'The password is too weak.';
//       } else {
//         errorMessage = 'Error: ${e.message}';
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving data: $e')),
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
//           padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
//           child: Column(
//             children: [
//               Image.asset('assets/images/thumbnil.png'),
//               const Center(
//                 child: Text(
//                   'Signup',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Name field
//               _buildTextField(nameController, 'Name', Icons.person),
//               // Email field
//               _buildTextField(emailController, 'Email', Icons.email),
//               // Password field
//               _buildPasswordField(),
//               // Club Type dropdown
//               _buildClubTypeDropdown(),
//               // Signup button
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: RoundButton(title: "Signup", onTap: saveToFirestore),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       TextEditingController controller, String hintText, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: const Border(
//             top: BorderSide(color: Colors.black, width: 1),
//             left: BorderSide(color: Colors.black, width: 1),
//             right: BorderSide(color: Colors.black, width: 5),
//             bottom: BorderSide(color: Colors.black, width: 4),
//           ),
//         ),
//         child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: hintText,
//             border: InputBorder.none,
//             prefixIcon: Icon(icon),
//             contentPadding: const EdgeInsets.symmetric(vertical: 20),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPasswordField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: const Border(
//             top: BorderSide(color: Colors.black, width: 1),
//             left: BorderSide(color: Colors.black, width: 1),
//             right: BorderSide(color: Colors.black, width: 5),
//             bottom: BorderSide(color: Colors.black, width: 4),
//           ),
//         ),
//         child: TextFormField(
//           controller: passwordController,
//           obscureText: !_isPasswordVisible,
//           decoration: InputDecoration(
//             hintText: 'Password',
//             border: InputBorder.none,
//             prefixIcon: const Icon(Icons.lock),
//             contentPadding: const EdgeInsets.symmetric(vertical: 20),
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _isPasswordVisible = !_isPasswordVisible;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildClubTypeDropdown() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: const Border(
//             top: BorderSide(color: Colors.black, width: 1),
//             left: BorderSide(color: Colors.black, width: 1),
//             right: BorderSide(color: Colors.black, width: 5),
//             bottom: BorderSide(color: Colors.black, width: 4),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: selectedClubType,
//               hint: const Text('Select Club Type'),
//               isExpanded: true,
//               items: ['Official Club', 'Unofficial Club'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedClubType = newValue;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/super_admin/userprofile.dart';

import '../../splesh_screen/button.dart';

class SignupScreenSuperAdmin extends StatefulWidget {
  const SignupScreenSuperAdmin({super.key});

  @override
  State<SignupScreenSuperAdmin> createState() => _SignupScreenSuperAdminState();
}

class _SignupScreenSuperAdminState extends State<SignupScreenSuperAdmin> {
  bool _isPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedClubType;

  void saveToFirestore() async {
    if (selectedClubType == null || selectedClubType!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a club type.')),
      );
      return;
    }

    try {
      // Create user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Generate a unique document ID
      final docRef = FirebaseFirestore.instance.collection('all_clubs').doc();
      final docId = docRef.id;

      final userData = {
        'id': docId,
        'uid': userCredential.user!.uid,
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'clubType': selectedClubType,
      };

      // Save to Firestore collections based on club type
      if (selectedClubType == 'Official Club') {
        await FirebaseFirestore.instance
            .collection('official_clubs')
            .doc(docId)
            .set(userData);
      } else if (selectedClubType == 'Unofficial Club') {
        await FirebaseFirestore.instance
            .collection('unofficial_clubs')
            .doc(docId)
            .set(userData);
      }

      // Save to the general "all_clubs" collection
      await docRef.set(userData);

      // Successful signup message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful!')),
      );

      // Clear input fields
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      setState(() {
        selectedClubType = null;
      });

      // Debug print before navigation
      print("Navigating to next screen after successful signup...");

      // Navigate to next screen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already registered.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving data: $e')),
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
          padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
          child: Column(
            children: [
              Image.asset('assets/images/thumbnil.png'),
              const Center(
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Name field
              _buildTextField(nameController, 'Name', Icons.person),
              // Email field
              _buildTextField(emailController, 'Email', Icons.email),
              // Password field
              _buildPasswordField(),
              // Club Type dropdown
              _buildClubTypeDropdown(),
              // Signup button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RoundButton(title: "Signup", onTap: saveToFirestore),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
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
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: Icon(icon),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
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
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
    );
  }

  Widget _buildClubTypeDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.black, width: 1),
            right: BorderSide(color: Colors.black, width: 5),
            bottom: BorderSide(color: Colors.black, width: 4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedClubType,
              hint: const Text('Select Club Type'),
              isExpanded: true,
              items: ['Official Club', 'Unofficial Club'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedClubType = newValue;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
