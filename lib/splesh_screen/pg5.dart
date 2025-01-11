import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/splesh_screen/button.dart';
import 'package:flutter_application_2/controller/progress_controller_4.dart';
import 'package:flutter_application_2/splesh_screen/pg6.dart';
import 'package:flutter_application_2/splesh_screen/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WavyLineScreen4 extends StatefulWidget {
  const WavyLineScreen4({super.key});

  @override
  _WavyLineScreen4State createState() => _WavyLineScreen4State();
}

class _WavyLineScreen4State extends State<WavyLineScreen4> {
  Timer? _timer;
  TextEditingController dropdownController = TextEditingController();
  TextEditingController passingYearController = TextEditingController();
  final ProgressController4 progressController = Get.put(ProgressController4());
  String? _selectedCourses;
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
    // progressController.progress1.value = 0.8;
    _selectedCourses = value;
    setState(() {});
  }

  void _onPassingYearChanged(String value) {
    if (value.isNotEmpty && value.length == 4) {
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
    // Retrieve stored data when screen loads
    _retrieveData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    dropdownController.dispose();
    passingYearController.dispose();
    super.dispose();
  }

  bool _areFieldsFilled() {
    bool isValid = true;

    if (_selectedCourses == null) {
      genderError = 'Please select your Campus and course';
      isValid = false;
    } else {
      genderError = null;
    }

    if (passingYearController.text.isEmpty) {
      passingYearError = 'Please enter your passing year';
      isValid = false;
    } else if (passingYearController.text.length != 4) {
      passingYearError = 'Please enter a valid four-digit year';
      isValid = false;
    } else {
      final year = int.tryParse(passingYearController.text);
      final currentYear = DateTime.now().year + 10;
      if (year == null || year < 1900 || year > currentYear) {
        passingYearError = 'Please enter a valid year (1900 - $currentYear)';
        isValid = false;
      } else {
        passingYearError = null;
      }
    }

    setState(() {});
    return isValid;
  }

  // Store the data in SharedPreferences
  Future<void> _storeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCourse', _selectedCourses ?? '');
    await prefs.setString('passingYear', passingYearController.text);
    if (kDebugMode) {
      print(
          'Data saved Selected Course is :- ${_selectedCourses!} Passing year is ${passingYearController.text}');
    }
  }

  // Retrieve data from SharedPreferences
  Future<void> _retrieveData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCourses = prefs.getString('selectedCourse') ?? '';
      passingYearController.text = prefs.getString('passingYear') ?? '';
    });
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
                        value: progressController.progress1.value / 1.3,
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
                      hintText: "Passing year",
                      controller: passingYearController,
                      onChanged: (value) {
                        _onPassingYearChanged(value);
                      },
                    ),
                  ),
                  if (passingYearError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        passingYearError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
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
              onTap: () async {
                if (_areFieldsFilled()) {
                  await _storeData();
                  // Print the values before navigating
                  print('Selected Course: $_selectedCourses');
                  print('Passing Year: ${passingYearController.text}');

                  Get.to(const WavyLineScreen5());
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
