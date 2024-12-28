// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/button.dart';
// import 'package:flutter_application_2/controller/progress_controller_3.dart';
// import 'package:flutter_application_2/pg5.dart';
// import 'package:flutter_application_2/wavePointer.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class WavyLineScreen3 extends StatefulWidget {
//   const WavyLineScreen3({super.key});

//   @override
//   _WavyLineScreen3State createState() => _WavyLineScreen3State();
// }

// class _WavyLineScreen3State extends State<WavyLineScreen3> {
//   Timer? _timer;
//   TextEditingController dropdownController = TextEditingController();
//   final ProgressController3 progressController = Get.put(ProgressController3());

//   String? code;

//   void _startProgress() {
//     if (_timer == null) {
//       const duration = Duration(milliseconds: 100);
//       _timer = Timer.periodic(duration, (timer) {
//         if (progressController.progress1.value >= 1.0) {
//           timer.cancel();
//           _timer = null;
//         } else {
//           progressController.startProgress1();
//         }
//       });
//     }
//   }

//   void _onNameChanged(String value) {
//     if (value.isNotEmpty) {
//       progressController.progress1.value = 0.1;
//       _startProgress();
//     } else {
//       progressController.resetProgress();
//       _timer?.cancel();
//       _timer = null;
//       setState(() {});
//     }
//   }

//   XFile? _image;

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? selectedImage =
//         await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = selectedImage;
//       if (_image != null) {
//         progressController.progress1.value = 0.8;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     dropdownController.addListener(() {
//       _onNameChanged(dropdownController.text);
//     });
//     _loadName();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     dropdownController.dispose();
//     super.dispose();
//   }

//   String? savedName;
//   Future<void> _loadName() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       savedName = prefs.getString('user_name'); // Retrieve the stored name
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 250, 232),
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 50),
//               Center(
//                 child: SizedBox(
//                   width: screenWidth / 4,
//                   child: Obx(() => LinearProgressIndicator(
//                         value: progressController.progress1.value / 1.3,
//                         backgroundColor: Colors.grey[300],
//                         color: Colors.black,
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: screenWidth * 0.1),
//                     child: const Text(
//                       "People would love \nto see you :)",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   // const SizedBox(height: 5),
//                   const Text(
//                     "(PS: you got no options ;D)",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.start,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Flexible(
//                           child: Container(
//                             margin: EdgeInsets.only(
//                               top: mediaQuery.size.height * 0.05,
//                             ),
//                             height: mediaQuery.size.height * 0.19,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               border: const Border(
//                                 top: BorderSide(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   width: 1,
//                                 ),
//                                 left: BorderSide(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   width: 5,
//                                 ),
//                                 right: BorderSide(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   width: 1,
//                                 ),
//                                 bottom: BorderSide(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   width: 7,
//                                 ),
//                               ),
//                               borderRadius: BorderRadius.circular(14.82),
//                               image: const DecorationImage(
//                                 image:
//                                     AssetImage('assets/images/sampleimg.png'),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Flexible(
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 top: mediaQuery.size.height * 0.05),
//                             height: mediaQuery.size.height * 0.19,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               border: const Border(
//                                 top: BorderSide(color: Colors.black, width: 1),
//                                 left: BorderSide(color: Colors.black, width: 5),
//                                 right:
//                                     BorderSide(color: Colors.black, width: 1),
//                                 bottom:
//                                     BorderSide(color: Colors.black, width: 7),
//                               ),
//                               borderRadius: BorderRadius.circular(14.82),
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 _pickImage();
//                                 if (_image != null) {
//                                   print('Image selected');
//                                 } else {
//                                   print('No image selected');
//                                 }
//                               },
//                               child: Center(
//                                 child: _image == null
//                                     ? const Icon(
//                                         Icons.add_a_photo,
//                                         size: 24,
//                                         color: Colors.black,
//                                       )
//                                     : Image.file(
//                                         File(_image!.path),
//                                         fit: BoxFit
//                                             .fitWidth, // Change to fitWidth
//                                         width: double
//                                             .infinity, // Ensure it takes full width
//                                         height: mediaQuery.size.height *
//                                             0.19, // Set height explicitly
//                                       ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           Positioned(
//             top: screenHeight * 0.55,
//             right: screenWidth * 0.01,
//             child: Container(
//               width: 500,
//               height: 100,
//               child: Obx(() => CustomPaint(
//                     painter: WavyLinePainter(
//                       progressController.progress.value,
//                       amplitude: 60.0,
//                       frequency: 1.0,
//                       color: Colors.black,
//                       storkwidth: 20.0,
//                     ),
//                   )),
//             ),
//           ),
//           Positioned(
//             bottom: screenHeight * 0.11,
//             right: screenWidth * 0.08,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   "assets/images/Runner4.svg",
//                   width: screenWidth * 0.8,
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: screenHeight * 0.11,
//             left: 0, // Add left property for proper positioning
//             right: 0, // Add right property for proper positioning
//             child: const Center(
//               child: Text(
//                 "*Make sure to use your photos, we don't want your friend \nto be taken by someone else",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 10,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: screenWidth * 0.10,
//             left: screenWidth * 0.1,
//             right: screenWidth * 0.1,
//             child: RoundButton(
//               title: 'Next',
//               onTap: () {
//                 Get.to(const WavyLineScreen4());
//                 print('Next button tapped');
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_3.dart';
import 'package:flutter_application_2/pg5.dart';
import 'package:flutter_application_2/wavePointer.dart';
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
  String? _image; // Changed to String to store the SVG data
  String? savedName; // Variable to hold the name from SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadName(); // Load the saved name
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

  // Load the name from SharedPreferences
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString('user_name'); // Retrieve the stored name
    });
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
  }

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image =
          selectedImage?.path ?? ''; // Store the path if an image is picked
      if (_image == null || _image!.isEmpty) {
        _generateDummyImage(); // Generate a dummy image if no image is selected
      } else {
        progressController.progress1.value = 0.8;
      }
    });
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

  // Load the image from SharedPreferences
  Future<void> _loadImageFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString('dummyImage');

    if (savedImage != null) {
      setState(() {
        _image = savedImage; // Store the SVG string
      });
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
                                _pickImage();
                                if (_image != null && _image!.isNotEmpty) {
                                  print('Image selected');
                                } else {
                                  print('No image selected');
                                }
                              },
                              child: Center(
                                child: _image == null || _image!.isEmpty
                                    ? const Icon(
                                        Icons.add_a_photo,
                                        size: 24,
                                        color: Colors.black,
                                      )
                                    : SvgPicture.string(
                                        _image!, // Render the SVG from the string
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                        height: mediaQuery.size.height * 0.19,
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
                  "assets/images/Runner4.svg",
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
                // Check if the image is null, if it is, generate a dummy image
                if (_image == null || _image!.isEmpty) {
                  _generateDummyImage(); // Generate the dummy image
                }
                // After ensuring an image is available, proceed to the next screen
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
