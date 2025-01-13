import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/progress_controller_3.dart';
import 'package:flutter_application_2/splesh_screen/button.dart';
import 'package:flutter_application_2/splesh_screen/pg5.dart';
import 'package:flutter_application_2/splesh_screen/wavePointer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? _image; // Changed to String to store the image URL
  String? savedName; // Variable to hold the name from SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadName(); // Load the saved name
    dropdownController.addListener(() {
      _onNameChanged(dropdownController.text);
    });
    _loadImageUrl(); // Load the image URL if already stored
  }

  @override
  void dispose() {
    _timer?.cancel();
    dropdownController.dispose();
    super.dispose();
  }

  // Load the name from SharedPreferences
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString('user_name'); // Retrieve the stored name
    });
  }

  // Load the image URL from SharedPreferences
  Future<void> _loadImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final imageUrl = prefs.getString('profile_image_url');

    if (imageUrl != null && imageUrl.isNotEmpty) {
      setState(() {
        _image = imageUrl; // Set the image URL to the UI state
      });
    }
  }

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

    // If name is changed and no image exists, generate a dummy image
    if (_image == null || _image!.isEmpty) {
      _generateDummyImage(); // Only generate dummy image if no image exists
    }
  }

  // Pick an image from the gallery and upload to Firebase Storage
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      setState(() {
        _image = selectedImage.path; // Store the image path temporarily
      });

      // Upload the image to Firebase Storage
      try {
        final file = File(selectedImage.path);
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final storageRef =
            FirebaseStorage.instance.ref().child('uploads/$fileName');

        // Upload file
        final uploadTask = storageRef.putFile(file);
        await uploadTask
            .whenComplete(() => null); // Wait for the upload to complete

        // Get the download URL
        final downloadURL = await storageRef.getDownloadURL();

        // Store the download URL in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profile_image_url', downloadURL);

        setState(() {
          _image = downloadURL; // Store the URL in the UI state
        });

        print('Image uploaded successfully: $downloadURL');
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected');
    }
  }

  // Generate a dummy image using the Dicebear API with the saved name
  Future<void> _generateDummyImage() async {
    if (savedName == null || savedName!.isEmpty) return;

    // Build the URL for the Dicebear API using the saved name
    final url =
        Uri.parse('http://api.dicebear.com/5.x/initials/svg?seed=$savedName');

    // Fetch the image data from the URL
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Store the SVG data in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('dummyImage', response.body);

      setState(() {
        _image = response.body; // Store the SVG data
      });

      // Print the generated link to the console
      print('Generated dummy image link: $url');
    } else {
      print('Failed to fetch dummy image');
    }
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
            children: [
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                    width: screenWidth / 4,
                    child: Obx(() => LinearProgressIndicator(
                          value: progressController.progress1.value / 1.3,
                          backgroundColor: Colors.grey[300],
                          color: Colors.black,
                        ))),
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
                                _pickImage(); // Pick an image from gallery
                              },
                              child: Center(
                                child: _image == null || _image!.isEmpty
                                    ? const Icon(
                                        Icons.add_a_photo,
                                        size: 24,
                                        color: Colors.black,
                                      )
                                    : _image!.contains('<svg') // Check if SVG
                                        ? SvgPicture.string(
                                            _image!, // Render SVG if image is an SVG string
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                            height:
                                                mediaQuery.size.height * 0.19,
                                          )
                                        : Image.network(
                                            _image!, // Display image using network URL
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height:
                                                mediaQuery.size.height * 0.19,
                                          ),
                              ),
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
                  "assets/images/Runner4.svg", // Display runner image
                  width: screenWidth * 0.8,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.11,
            left: 0,
            right: 0,
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
                // If no image exists, decide whether to generate a dummy image or upload one
                if (_image == null || _image!.isEmpty) {
                  if (savedName == null || savedName!.isEmpty) {
                    // If there's no saved name, prompt for image upload
                    _pickImage(); // Allow image upload
                  } else {
                    // If there is a saved name, generate the dummy image
                    _generateDummyImage();
                  }
                }

                // After ensuring an image is available, proceed to the next screen
                if (_image != null && _image!.isNotEmpty) {
                  Get.to(const WavyLineScreen4());
                } else {
                  print('No image available');
                }

                print('Next button tapped');
              },
            ),
          ),
        ],
      ),
    );
  }
}
