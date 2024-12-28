import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_2.dart';
import 'package:flutter_application_2/pg4.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WavyLineScreen2 extends StatefulWidget {
  const WavyLineScreen2({super.key});

  @override
  _WavyLineScreen2State createState() => _WavyLineScreen2State();
}

class _WavyLineScreen2State extends State<WavyLineScreen2> {
  Timer? _timer;
  TextEditingController dropdownController = TextEditingController();
  final ProgressController2 progressController = Get.put(ProgressController2());
  String? _selectedGender;
  String? code; // This will hold the birthday input

  String? genderError;
  String? birthdayError;

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
      // progressController.progress1.value = 0.3;
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
    dropdownController.addListener(() {
      _onNameChanged(dropdownController.text);
    });
    _loadData(); // Load saved data
  }

  @override
  void dispose() {
    _timer?.cancel();
    dropdownController.dispose();
    super.dispose();
  }

  bool _areFieldsFilled() {
    bool isValid = true;

    if (_selectedGender == null) {
      genderError = 'Please select your gender';
      isValid = false;
    } else {
      genderError = null;
    }

    if (code == null || code!.isEmpty) {
      birthdayError = 'Please enter your birthday';
      isValid = false;
    } else {
      birthdayError = null;
    }

    setState(() {}); // Update UI for error messages
    return isValid;
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_gender', _selectedGender ?? '');
    await prefs.setString('birthday', code ?? '');
    print('Data saved: Gender: $_selectedGender, Birthday: $code');
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedGender = prefs.getString('selected_gender');
    code = prefs.getString('birthday');
    print('Loaded data: Gender: $_selectedGender, Birthday: $code');
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
                        value: progressController.progress1.value / 2,
                        backgroundColor: Colors.grey[300],
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "How should we \nrefer to you?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your gender identity",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownFormField(
                          controller: dropdownController,
                          hintText: 'Select Gender',
                          items: const ['Male', 'Female', 'Other'],
                          onChanged: (value) {
                            setState(() {
                              progressController.progress1.value = 0.8;
                              _selectedGender = value; // Store selected gender
                            });
                          },
                        ),
                        if (genderError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              genderError!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your Birthday DD-MM-YYYY",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth * 0.9,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Pinput(
                                  autofillHints: const [AutofillHints.birthday],
                                  length: 8,
                                  pinputAutovalidateMode:
                                      PinputAutovalidateMode.onSubmit,
                                  showCursor: true,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.length == 8) {
                                        String formattedBirthday =
                                            '${value.substring(0, 2)}-${value.substring(2, 4)}-${value.substring(4, 8)}';
                                        code = formattedBirthday;
                                        print(
                                            "Formatted input: $formattedBirthday");
                                        // progressController.progress1.value =
                                        //     0.6;
                                      } else {
                                        code =
                                            value; // Store unformatted input if not valid
                                      }
                                    });
                                  },
                                  defaultPinTheme: PinTheme(
                                    width: 56,
                                    height: 56,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: const Border(
                                        top: BorderSide(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 1,
                                        ),
                                        left: BorderSide(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 4,
                                        ),
                                        right: BorderSide(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 1,
                                        ),
                                        bottom: BorderSide(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 6,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                if (birthdayError != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      birthdayError!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.55,
            right: screenWidth * 0.1,
            child: Container(
              width: 500,
              height: 100,
              child: Obx(() => CustomPaint(
                    painter: WavyLinePainter1(
                      progressController.progress.value,
                      amplitude: 60.0,
                      frequency: 1.0,
                      color: Colors.black,
                      stockWidth: 20.0,
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.11,
            right: screenWidth * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Runner3.svg",
                  width: screenWidth * 0.8,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.10,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: RoundButton(
              title: 'Next',
              onTap: () async {
                if (_areFieldsFilled()) {
                  // Save data to SharedPreferences
                  await _saveData();

                  // Print the values for debugging
                  print('Selected Gender: $_selectedGender');
                  print(
                      'Birthday: $code'); // Pinput value is in DD-MM-YYYY format

                  // Navigate to the next screen
                  Get.to(const WavyLineScreen3());
                  print('Next button tapped');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
