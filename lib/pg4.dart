import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_2.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WavyLineScreen3 extends StatefulWidget {
  const WavyLineScreen3({super.key});

  @override
  _WavyLineScreen3State createState() => _WavyLineScreen3State();
}

class _WavyLineScreen3State extends State<WavyLineScreen3> {
  Timer? _timer;
  TextEditingController dropdownController = TextEditingController();
  final ProgressController2 progressController = Get.put(ProgressController2());
  String? _selectedGender;
  String? code;

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
      progressController.progress1.value = 0.1;
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
  }

  @override
  void dispose() {
    _timer?.cancel();
    dropdownController.dispose();
    super.dispose();
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
                        value: progressController.progress1.value / 3,
                        backgroundColor: Colors.grey[300],
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.1),
                        child: const Text(
                          "People would love \nto see you :)",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      const Text(
                        "(PS: you got no options ;D)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.55,
            right: screenWidth * 0.1,
            child: Container(
              width: 500, // Adjust as necessary
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
              onTap: () {
                Get.to(const WavyLineScreen3());
                print('Next button tapped');
              },
            ),
          ),
        ],
      ),
    );
  }
}
