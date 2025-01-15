import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../splesh_screen/button.dart';

class SignupScreenSuperAdmin extends StatefulWidget {
  const SignupScreenSuperAdmin({super.key});

  @override
  State<SignupScreenSuperAdmin> createState() => _SignupScreenSuperAdminState();
}

class _SignupScreenSuperAdminState extends State<SignupScreenSuperAdmin> {
  bool _isPasswordVisible = false; // State variable to toggle password visibility
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedClubType; // State variable for the dropdown menu

  void saveToFirestore() async {
    if (selectedClubType == null || selectedClubType!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a club type.')),
      );
      return;
    }

    final userData = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'clubType': selectedClubType,
    };

    try {
      if (selectedClubType == 'Official Club') {
        await FirebaseFirestore.instance.collection('official_clubs').add(userData);
      } else if (selectedClubType == 'Unofficial Club') {
        await FirebaseFirestore.instance.collection('unofficial_clubs').add(userData);
      }
      await FirebaseFirestore.instance.collection('all_clubs').add(userData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully.')),
      );

      nameController.clear();
      emailController.clear();
      passwordController.clear();
      setState(() {
        selectedClubType = null;
      });
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
      body: SingleChildScrollView( // Added to prevent overflow
        child: Padding(
          padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1),
          child: Column(
            children: [
              Image.asset(
                'assets/images/thumbnil.png',
              ),
              const Center(
                child: Text(
                  'Signup',
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
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
                    obscureText: !_isPasswordVisible, // Toggle password visibility
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedClubType,
                        hint: const Text('Select Club Type'),
                        isExpanded: true,
                        items: [
                          'Official Club',
                          'Unofficial Club'
                        ].map((String value) {
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RoundButton(
                    title: "Login",
                    onTap: saveToFirestore),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
