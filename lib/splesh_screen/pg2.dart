import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/splesh_screen/button.dart';
import 'package:flutter_application_2/controller/progress_controller_1.dart';
import 'package:flutter_application_2/splesh_screen/pg3.dart';
import 'package:flutter_application_2/splesh_screen/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WavyLineScreen extends StatefulWidget {
  const WavyLineScreen({super.key});

  @override
  _WavyLineScreenState createState() => _WavyLineScreenState();
}

class _WavyLineScreenState extends State<WavyLineScreen> {
  Timer? _timer;
  final TextEditingController namecontroller = TextEditingController();
  final ProgressController1 progressController = Get.put(ProgressController1());

  // Step 1: Create a GlobalKey for the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _startProgress() {
    if (_timer == null) {
      const duration = Duration(milliseconds: 100);
      _timer = Timer.periodic(duration, (timer) {
        if (progressController.progress1.value >= 1.0) {
          timer.cancel();
          _timer = null;
        } else {
          progressController.startProgress1();
        }
      });
    }
  }

  void _onNameChanged(String value) {
    if (value.isNotEmpty) {
      // progressController.progress1.value = 0.3; // Initial progress value
      _startProgress();
    } else {
      progressController.resetProgress();
      _timer?.cancel();
      _timer = null;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    namecontroller.addListener(() {
      _onNameChanged(namecontroller.text);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    namecontroller.dispose();
    super.dispose();
  }

  Future<void> _storeName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name); // Save name in SharedPreferences
    print('Name saved: $name');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 232),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: screenWidth / 4,
                  child: Obx(() => LinearProgressIndicator(
                        value: progressController.progress1.value / 4,
                        backgroundColor: Colors.grey[300],
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey, // Step 2: Wrap the fields with a Form widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "What’s your full\nname?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextFormField(
                        hintText: "Enter your name",
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
                          if (!nameRegex.hasMatch(value)) {
                            return 'Please enter a valid name (letters and spaces only)';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _onNameChanged(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/logo/logo3.svg",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "This name will be displayed on your profile ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.5,
            right: screenWidth * 0.08,
            child: Obx(() => CustomPaint(
                  painter: WavyLinePainter(
                    progressController.progress.value,
                    color: Colors.black,
                    amplitude: 90.0,
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
            bottom: screenHeight * 0.15,
            right: screenWidth * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Runner2.svg",
                  width: screenWidth * 0.8,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.14,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: RoundButton(
              title: 'Next',
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  // Step 3: Store the name and navigate to the next screen
                  await _storeName(namecontroller.text);
                  Get.to(const WavyLineScreen2());
                  print(
                      'Next button tapped with valid name: ${namecontroller.text}');
                } else {
                  print('Form is not valid');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
