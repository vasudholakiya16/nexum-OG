import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_4.dart';
import 'package:flutter_application_2/pg4.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WavyLineScreen4 extends StatefulWidget {
  const WavyLineScreen4({super.key});

  @override
  _WavyLineScreen4State createState() => _WavyLineScreen4State();
}

class _WavyLineScreen4State extends State<WavyLineScreen4> {
  Timer? _timer;
  TextEditingController dropdownController = TextEditingController();
  TextEditingController passingYearController =
      TextEditingController(); // New controller
  final ProgressController4 progressController = Get.put(ProgressController4());
  String? _selectedGender;
  String? genderError;
  String? passingYearError;

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

  void _onDropdownChanged(String? value) {
    progressController.progress1.value = 0.7;
    _selectedGender = value; // Store selected gender
    setState(() {});
  }

  void _onPassingYearChanged(String value) {
    if (value.isNotEmpty) {
      progressController.progress1.value = 0.9;
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
      _onDropdownChanged(dropdownController.text);
    });
    passingYearController.addListener(() {
      _onPassingYearChanged(passingYearController.text);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    dropdownController.dispose();
    passingYearController.dispose(); // Dispose the new controller
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

    if (passingYearController.text.isEmpty) {
      passingYearError = 'Please enter your passing year';
      isValid = false;
    } else {
      final year = int.tryParse(passingYearController.text);
      final currentYear = DateTime.now().year;
      if (year == null || year < 1900 || year > currentYear) {
        passingYearError = 'Please enter a valid year (1900 - $currentYear)';
        isValid = false;
      } else {
        passingYearError = null;
      }
    }

    setState(() {}); // Update UI for error messages
    return isValid;
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
                        value: progressController.progress1.value / 1.4,
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
                    "Tell us about \nyourself",
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
                          "Campus and course",
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
                          hintText: 'Select options',
                          items: const [
                            'Data Structures',
                            'Algorithms',
                            'Operating Systems',
                            'Database Management Systems',
                            'Software Engineering',
                            'Computer Networks',
                            'Artificial Intelligence',
                            'Machine Learning',
                            'Web Development',
                            'Mobile App Development'
                          ],
                          onChanged: _onDropdownChanged,
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
                          "Passing year",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 250.0, top: 10.0),
                    child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      hintText: "passing year",
                      controller: passingYearController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your passing year';
                        }
                        // Check if the input is a valid year (e.g., 1900 - current year)
                        final year = int.tryParse(value);
                        final currentYear = DateTime.now().year;
                        if (year == null || year < 1900 || year > currentYear) {
                          return 'Please enter a valid year (1900 - $currentYear)';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _onPassingYearChanged(value);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.69,
            right: screenWidth * 0.50,
            child: Container(
              width: 500,
              height: 100,
              child: Obx(() => CustomPaint(
                    painter: WavyLinePainter(
                      progressController.progress.value,
                      amplitude: 140.0,
                      frequency: 2.0,
                      color: Colors.black,
                      storkwidth: 20.0,
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.07,
            right: screenWidth * 0.14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Runner5.svg",
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
              onTap: () {
                if (_areFieldsFilled()) {
                  // Print the values before navigating
                  print('Selected Gender: $_selectedGender');
                  print('Passing Year: ${passingYearController.text}');

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
