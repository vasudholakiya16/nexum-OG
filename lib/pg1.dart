import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/HomePage/home.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/common/apis.dart';
import 'package:flutter_application_2/common/dialogs.dart';
import 'package:flutter_application_2/constent/images.dart';
import 'package:flutter_application_2/constent/text.dart';
import 'package:flutter_application_2/controller/progress_controller.dart';
import 'package:flutter_application_2/pg2.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  /// Stores data in SharedPreferences
  Future<void> storeData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('Data stored: $key -> $value');
  }

  /// Retrieves data from SharedPreferences
  Future<String?> retrieveData(String key, String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('status', status);
    // prefs.getString(key);
    print('Data retrieved: $key -> $status');
    return prefs.getString(key);
  }

  _handleGoogleBtnClick(BuildContext context) {
    //for showing progress bar
    Dialogs.showProgressBar(context);

    _signInWithGoogle(context).then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        print('\nUser: ${user.user}');
        print('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if (await APIs.userExists() && mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Home()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Home()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle(BuildContext context) async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      print('\n_signInWithGoogle: $e');

      if (mounted) {
        Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      }

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProgressController controller = Get.put(ProgressController());

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 232),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: screenHeight * 0.36,
            right: screenWidth * 0.1,
            child: Obx(() => CustomPaint(
                  painter: WavyLinePainter1(
                    controller.progress.value,
                    amplitude: 150.0,
                    frequency: 1.0,
                    color: const Color.fromARGB(255, 255, 242, 194),
                    stockWidth: 5.0,
                  ),
                  child: Container(
                    width: 500,
                    height: 100,
                  ),
                )),
          ),
          Positioned(
            top: screenHeight * 0.1,
            child: const Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.01,
            right: screenWidth * 0.1,
            child: Obx(() => CustomPaint(
                  painter: WavyLinePainter(
                    controller.progress.value,
                    color: const Color.fromARGB(255, 255, 242, 194),
                    amplitude: 80.0,
                    frequency: 2.0,
                    storkwidth: 5.0,
                  ),
                  child: Container(
                    width: 500,
                    height: 100,
                  ),
                )),
          ),
          Positioned(
            top: screenHeight * 0.3,
            child: Obx(() => CustomPaint(
                  painter: WavyLinePainter(
                    controller.progress.value,
                    color: Colors.black,
                    amplitude: 80.0,
                    frequency: 2.0,
                    storkwidth: 20.0,
                  ),
                  child: Container(
                    width: 500,
                    height: 100,
                  ),
                )),
          ),
          Positioned(
            top: screenHeight * 0.26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  runner,
                  width: screenWidth * 0.8,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.55,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: RoundButton(
              title: connectWithGoogle,
              onTap: () async {
                // Store Google connection status
                // await storeData('login_method', 'google');
                // String? method = await retrieveData('login_method');
                // print('Retrieved method: $method');
                _handleGoogleBtnClick(context);
                await storeData('account_status', 'Google');
              },
              imagePath: 'assets/logo/logo1.png',
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.27,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Column(
              children: [
                RoundButton(
                  title: connectWithFacebook,
                  onTap: () async {
                    // Store Facebook connection status
                    // await storeData('login_method', 'facebook');
                    // String? method = await retrieveData('login_method');
                    // print('Retrieved method: $method');
                  },
                  imagePath: 'assets/logo/logo2.png',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.14,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: OurverButton(
              title: 'Create an account',
              onTap: () async {
                // Store account creation status
                await storeData('account_status', 'created');
                Get.to(const WavyLineScreen());
              },
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.04,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: const Text(
              'Remember to connect your university mail and register to agree to our Terms and Conditions.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
