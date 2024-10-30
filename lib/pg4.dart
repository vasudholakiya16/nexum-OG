import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_3.dart';
import 'package:flutter_application_2/pg5.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WavyLineScreen3 extends StatefulWidget {
  const WavyLineScreen3({super.key});

  @override
  _WavyLineScreen3State createState() => _WavyLineScreen3State();
}

class _WavyLineScreen3State extends State<WavyLineScreen3> {
  Timer? _timer;
  TextEditingController dropdownController = TextEditingController();
  final ProgressController3 progressController = Get.put(ProgressController3());

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

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
      if (_image != null) {
        progressController.progress1.value = 0.8;
      }
    });
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
            // mainAxisAlignment: MainAxisAlignment.center,
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: mediaQuery.size.height * 0.05,
                            ),
                            height: mediaQuery.size.height * 0.19,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: const Border(
                                top: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 5,
                                ),
                                right: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 7,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(14.82),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/sampleimg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: mediaQuery.size.height * 0.05),
                            height: mediaQuery.size.height * 0.19,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: const Border(
                                top: BorderSide(color: Colors.black, width: 1),
                                left: BorderSide(color: Colors.black, width: 5),
                                right:
                                    BorderSide(color: Colors.black, width: 1),
                                bottom:
                                    BorderSide(color: Colors.black, width: 7),
                              ),
                              borderRadius: BorderRadius.circular(14.82),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _pickImage();
                                if (_image != null) {
                                  print('Image selected');
                                } else {
                                  print('No image selected');
                                }
                              },
                              child: Center(
                                child: _image == null
                                    ? const Icon(
                                        Icons.add_a_photo,
                                        size: 24,
                                        color: Colors.black,
                                      )
                                    : Image.file(
                                        File(_image!.path),
                                        fit: BoxFit
                                            .fitWidth, // Change to fitWidth
                                        width: double
                                            .infinity, // Ensure it takes full width
                                        height: mediaQuery.size.height *
                                            0.19, // Set height explicitly
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.55,
            right: screenWidth * 0.01,
            child: Container(
              width: 500,
              height: 100,
              child: Obx(() => CustomPaint(
                    painter: WavyLinePainter(
                      progressController.progress.value,
                      amplitude: 60.0,
                      frequency: 1.0,
                      color: Colors.black,
                      storkwidth: 20.0,
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
                  "assets/images/Runner4.svg",
                  width: screenWidth * 0.8,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.11,
            left: 0, // Add left property for proper positioning
            right: 0, // Add right property for proper positioning
            child: const Center(
              child: Text(
                "*Make sure to use your photos, we don't want your friend \nto be taken by someone else",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: screenWidth * 0.10,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: RoundButton(
              title: 'Next',
              onTap: () {
                Get.to(const WavyLineScreen4());
                print('Next button tapped');
              },
            ),
          ),
        ],
      ),
    );
  }
}
