// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/button.dart';
// import 'package:flutter_application_2/controller/progress_controller_4.dart';
// import 'package:flutter_application_2/pg7.dart';
// import 'package:get/get.dart';

// class WavyLineScreen5 extends StatefulWidget {
//   const WavyLineScreen5({super.key});

//   @override
//   _WavyLineScreen5State createState() => _WavyLineScreen5State();
// }

// class _WavyLineScreen5State extends State<WavyLineScreen5> {
//   Timer? _timer;

//   final ProgressController4 progressController = Get.put(ProgressController4());
//   String? _selectedGender;
//   String? genderError;
//   String? passingYearError;
//   bool _isSelected = false;

//   void _toggleIsSelected() {
//     setState(() {
//       _isSelected = !_isSelected;
//     });
//   }

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

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   List<String> selectedOptions = [];
//   List<String> selectedOptions1 = [];
//   final List<Color> lightColors = [
//     Colors.lightBlueAccent,
//     Colors.lightGreenAccent,
//     Colors.pinkAccent,
//     Colors.yellowAccent,
//     Colors.purpleAccent,
//     Colors.orangeAccent,
//     Colors.cyanAccent,
//     Colors.redAccent,
//   ];

//   void _toggleSelection(String title) {
//     setState(() {
//       if (selectedOptions.contains(title)) {
//         selectedOptions.remove(title);
//       } else if (selectedOptions.length < 5) {
//         selectedOptions.add(title);
//       }
//     });
//   }

//   Color _getColor(String title) {
//     int index = [
//       '🎮 Games',
//       '🎧 Music',
//       '🥂 Clubbing',
//       '🎨 Painting',
//       '📚 Reading',
//       '🍿 Movie Marathons',
//       '🧁 Baking',
//       '💊 Cooking meth',
//       '💻 Repairing laptops',
//       '🧑‍🤝‍🧑 Back bitchin of colleagues',
//       '🥛 Lassi'
//     ].indexOf(title);

//     return selectedOptions.contains(title) && index != -1
//         ? lightColors[index % lightColors.length]
//         : Colors.transparent;
//   }

//   void _toggleSelection1(String title) {
//     setState(() {
//       if (selectedOptions1.contains(title)) {
//         selectedOptions1.remove(title);
//       } else if (selectedOptions1.length < 5) {
//         selectedOptions1.add(title);
//       }
//     });
//   }

//   Color _getColor1(String title) {
//     int index = [
//       '✈️ Traveling',
//       '🏖️ Beach Holidays',
//       '🏔️ Mountain Hiking',
//       '🌍 Exploring Cultures',
//       '🚗 Road Trips',
//       '🛳️ Cruises',
//       '🏕️ Camping',
//       '🌄 Adventure Sports',
//       '📷 Photography',
//       '🥘 Culinary Tours',
//       '🌸 City Sightseeing'
//     ].indexOf(title);

//     return selectedOptions1.contains(title) && index != -1
//         ? lightColors[index % lightColors.length]
//         : Colors.transparent;
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
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(height: 50),
//               Center(
//                 child: SizedBox(
//                   width: screenWidth / 4,
//                   child: Obx(() => LinearProgressIndicator(
//                         value: progressController.progress1.value / 1.2,
//                         backgroundColor: Colors.grey[300],
//                         color: Colors.black,
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "We’re Interested \nin knowing about \nyou",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Select at least  5 interest",
//                           style: TextStyle(
//                             color: Color(0xFF929293),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Hobbies On Free time",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 16.0, top: 8.0, right: 16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🎮 Games',
//                               onTap: () => _toggleSelection('🎮 Games'),
//                               color: _getColor('🎮 Games'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🎧 Music',
//                               onTap: () => _toggleSelection('🎧 Music'),
//                               color: _getColor('🎧 Music'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🥂 Clubbing',
//                               onTap: () => _toggleSelection('🥂 Clubbing'),
//                               color: _getColor('🥂 Clubbing'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🎨 Painting',
//                               onTap: () => _toggleSelection('🎨 Painting'),
//                               color: _getColor('🎨 Painting'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '📚 Reading',
//                               onTap: () => _toggleSelection('📚 Reading'),
//                               color: _getColor('📚 Reading'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🍿 Movie Marathons',
//                               onTap: () =>
//                                   _toggleSelection('🍿 Movie Marathons'),
//                               color: _getColor('🍿 Movie Marathons'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🧁 Baking',
//                               onTap: () => _toggleSelection('🧁 Baking'),
//                               color: _getColor('🧁 Baking'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '💊 Cooking meth',
//                               onTap: () => _toggleSelection('💊 Cooking meth'),
//                               color: _getColor('💊 Cooking meth'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '💻 Repairing laptops',
//                               onTap: () =>
//                                   _toggleSelection('💻 Repairing laptops'),
//                               color: _getColor('💻 Repairing laptops'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🧑‍🤝‍🧑 Back bitchin of colleagues',
//                               onTap: () => _toggleSelection(
//                                   '🧑‍🤝‍🧑 Back bitchin of colleagues'),
//                               color: _getColor(
//                                   '🧑‍🤝‍🧑 Back bitchin of colleagues'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🥛 Lassi',
//                               onTap: () => _toggleSelection('🥛 Lassi'),
//                               color: _getColor('🥛 Lassi'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Travelling",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 16.0, top: 8.0, right: 16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '✈️ Traveling',
//                               onTap: () => _toggleSelection1('✈️ Traveling'),
//                               color: _getColor1('✈️ Traveling'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🏖️ Beach Holidays',
//                               onTap: () =>
//                                   _toggleSelection1('🏖️ Beach Holidays'),
//                               color: _getColor1('🏖️ Beach Holidays'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🌍 Exploring Cultures',
//                               onTap: () =>
//                                   _toggleSelection1('🌍 Exploring Cultures'),
//                               color: _getColor1('🌍 Exploring Cultures'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🚗 Road Trips',
//                               onTap: () => _toggleSelection1('🚗 Road Trips'),
//                               color: _getColor1('🚗 Road Trips'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🛳️ Cruises',
//                               onTap: () => _toggleSelection1('🛳️ Cruises'),
//                               color: _getColor1('🛳️ Cruises'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🏕️ Camping',
//                               onTap: () => _toggleSelection1('🏕️ Camping'),
//                               color: _getColor1('🏕️ Camping'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🌄 Adventure Sports',
//                               onTap: () =>
//                                   _toggleSelection1('🌄 Adventure Sports'),
//                               color: _getColor1('🌄 Adventure Sports'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '📷 Photography',
//                               onTap: () => _toggleSelection1('📷 Photography'),
//                               color: _getColor1('📷 Photography'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🥘 Culinary Tours',
//                               onTap: () =>
//                                   _toggleSelection1('🥘 Culinary Tours'),
//                               color: _getColor1('🥘 Culinary Tours'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             SelectedOption(
//                               title: '🌸 City Sightseeing',
//                               onTap: () =>
//                                   _toggleSelection1('🌸 City Sightseeing'),
//                               color: _getColor1('🌸 City Sightseeing'),
//                             ),
//                             SizedBox(width: 5),
//                             SelectedOption(
//                               title: '🏔️ Mountain Hiking',
//                               onTap: () =>
//                                   _toggleSelection1('🏔️ Mountain Hiking'),
//                               color: _getColor1('🏔️ Mountain Hiking'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   RoundButton(
//                       title: 'Next',
//                       onTap: () {
//                         if (selectedOptions.isEmpty &&
//                             selectedOptions1.isEmpty) {
//                           // Show an alert dialog if no options are selected
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text("Selection Error"),
//                                 content: const Text(
//                                     "Please select at least one option!"),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text("OK"),
//                                     onPressed: () {
//                                       // progressController.progress1.value = 0.95;
//                                       Navigator.of(context)
//                                           .pop(); // Close the dialog
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         } else {
//                           // Print selected options
//                           print("Selected Hobbies: $selectedOptions");
//                           print(
//                               "Selected Traveling Options: $selectedOptions1");

//                           // Navigate to the next screen
//                           Get.to(const WavyLineScreen6());
//                         }
//                       }

//                       // onTap: () {
//                       //   Get.to(const WavyLineScreen3());
//                       // },
//                       ),
//                 ],
//               ),
//             ],
//           ),
//           // Positioned(
//           //   bottom: screenWidth * 0.10,
//           //   left: screenWidth * 0.1,
//           //   right: screenWidth * 0.1,
//           //   child: RoundButton(
//           //       title: 'Next',
//           //       onTap: () {
//           //         if (selectedOptions.isEmpty && selectedOptions1.isEmpty) {
//           //           // Show an alert dialog if no options are selected
//           //           showDialog(
//           //             context: context,
//           //             builder: (BuildContext context) {
//           //               return AlertDialog(
//           //                 title: const Text("Selection Error"),
//           //                 content:
//           //                     const Text("Please select at least one option!"),
//           //                 actions: [
//           //                   TextButton(
//           //                     child: const Text("OK"),
//           //                     onPressed: () {
//           //                       // progressController.progress1.value = 0.95;
//           //                       Navigator.of(context).pop(); // Close the dialog
//           //                     },
//           //                   ),
//           //                 ],
//           //               );
//           //             },
//           //           );
//           //         } else {
//           //           // Print selected options
//           //           print("Selected Hobbies: $selectedOptions");
//           //           print("Selected Traveling Options: $selectedOptions1");

//           //           // Navigate to the next screen
//           //           Get.to(const WavyLineScreen6());
//           //         }
//           //       }

//           //       // onTap: () {
//           //       //   Get.to(const WavyLineScreen3());
//           //       // },
//           //       ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/controller/progress_controller_4.dart';
import 'package:flutter_application_2/pg7.dart';
import 'package:get/get.dart';

class WavyLineScreen5 extends StatefulWidget {
  const WavyLineScreen5({super.key});

  @override
  _WavyLineScreen5State createState() => _WavyLineScreen5State();
}

class _WavyLineScreen5State extends State<WavyLineScreen5> {
  Timer? _timer;
  final ProgressController4 progressController = Get.put(ProgressController4());
  // String? _selectedGender;
  String? genderError;
  String? passingYearError;
  // bool _isSelected = false;

  List<String> selectedOptions = [];
  List<String> selectedOptions1 = [];
  final List<Color> lightColors = [
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.cyanAccent,
    Colors.redAccent,
  ];

  void _toggleSelection(String title) {
    setState(() {
      if (selectedOptions.contains(title)) {
        selectedOptions.remove(title);
      } else if (selectedOptions.length < 5) {
        selectedOptions.add(title);
      }
    });
  }

  Color _getColor(String title) {
    int index = [
      '🎮 Games',
      '🎧 Music',
      '🥂 Clubbing',
      '🎨 Painting',
      '📚 Reading',
      '🍿 Movie Marathons',
      '🧁 Baking',
      '💊 Cooking meth',
      '💻 Repairing laptops',
      '🧑‍🤝‍🧑 Back bitchin of colleagues',
      '🥛 Lassi'
    ].indexOf(title);

    return selectedOptions.contains(title) && index != -1
        ? lightColors[index % lightColors.length]
        : Colors.transparent;
  }

  void _toggleSelection1(String title) {
    setState(() {
      if (selectedOptions1.contains(title)) {
        selectedOptions1.remove(title);
      } else if (selectedOptions1.length < 5) {
        selectedOptions1.add(title);
      }
    });
  }

  Color _getColor1(String title) {
    int index = [
      '✈️ Traveling',
      '🏖️ Beach Holidays',
      '🏔️ Mountain Hiking',
      '🌍 Exploring Cultures',
      '🚗 Road Trips',
      '🛳️ Cruises',
      '🏕️ Camping',
      '🌄 Adventure Sports',
      '📷 Photography',
      '🥘 Culinary Tours',
      '🌸 City Sightseeing'
    ].indexOf(title);

    return selectedOptions1.contains(title) && index != -1
        ? lightColors[index % lightColors.length]
        : Colors.transparent;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 232),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            // Enable scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: screenWidth / 4,
                    child: Obx(() => LinearProgressIndicator(
                          value: progressController.progress1.value / 1.2,
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
                      "We’re Interested \nin knowing about \nyou",
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
                            "Select at least  5 interest",
                            style: TextStyle(
                              color: Color(0xFF929293),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hobbies On Free time",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Hobbies Selection
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, right: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SelectedOption(
                                title: '🎮 Games',
                                onTap: () => _toggleSelection('🎮 Games'),
                                color: _getColor('🎮 Games'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🎧 Music',
                                onTap: () => _toggleSelection('🎧 Music'),
                                color: _getColor('🎧 Music'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🥂 Clubbing',
                                onTap: () => _toggleSelection('🥂 Clubbing'),
                                color: _getColor('🥂 Clubbing'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🎨 Painting',
                                onTap: () => _toggleSelection('🎨 Painting'),
                                color: _getColor('🎨 Painting'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '📚 Reading',
                                onTap: () => _toggleSelection('📚 Reading'),
                                color: _getColor('📚 Reading'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🍿 Movie Marathons',
                                onTap: () =>
                                    _toggleSelection('🍿 Movie Marathons'),
                                color: _getColor('🍿 Movie Marathons'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🧁 Baking',
                                onTap: () => _toggleSelection('🧁 Baking'),
                                color: _getColor('🧁 Baking'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '💊 Cooking meth',
                                onTap: () =>
                                    _toggleSelection('💊 Cooking meth'),
                                color: _getColor('💊 Cooking meth'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '💻 Repairing laptops',
                                onTap: () =>
                                    _toggleSelection('💻 Repairing laptops'),
                                color: _getColor('💻 Repairing laptops'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🧑‍🤝‍🧑 Back bitchin of colleagues',
                                onTap: () => _toggleSelection(
                                    '🧑‍🤝‍🧑 Back bitchin of colleagues'),
                                color: _getColor(
                                    '🧑‍🤝‍🧑 Back bitchin of colleagues'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🥛 Lassi',
                                onTap: () => _toggleSelection('🥛 Lassi'),
                                color: _getColor('🥛 Lassi'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Travelling",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, right: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SelectedOption(
                                title: '✈️ Traveling',
                                onTap: () => _toggleSelection1('✈️ Traveling'),
                                color: _getColor1('✈️ Traveling'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🏖️ Beach Holidays',
                                onTap: () =>
                                    _toggleSelection1('🏖️ Beach Holidays'),
                                color: _getColor1('🏖️ Beach Holidays'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🏔️ Mountain Hiking',
                                onTap: () =>
                                    _toggleSelection1('🏔️ Mountain Hiking'),
                                color: _getColor1('🏔️ Mountain Hiking'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🌍 Exploring Cultures',
                                onTap: () =>
                                    _toggleSelection1('🌍 Exploring Cultures'),
                                color: _getColor1('🌍 Exploring Cultures'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🚗 Road Trips',
                                onTap: () => _toggleSelection1('🚗 Road Trips'),
                                color: _getColor1('🚗 Road Trips'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🛳️ Cruises',
                                onTap: () => _toggleSelection1('🛳️ Cruises'),
                                color: _getColor1('🛳️ Cruises'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🏕️ Camping',
                                onTap: () => _toggleSelection1('🏕️ Camping'),
                                color: _getColor1('🏕️ Camping'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🌄 Adventure Sports',
                                onTap: () =>
                                    _toggleSelection1('🌄 Adventure Sports'),
                                color: _getColor1('🌄 Adventure Sports'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '📷 Photography',
                                onTap: () =>
                                    _toggleSelection1('📷 Photography'),
                                color: _getColor1('📷 Photography'),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SelectedOption(
                                title: '🥘 Culinary Tours',
                                onTap: () =>
                                    _toggleSelection1('🥘 Culinary Tours'),
                                color: _getColor1('🥘 Culinary Tours'),
                              ),
                              SizedBox(width: 5),
                              SelectedOption(
                                title: '🌸 City Sightseeing',
                                onTap: () =>
                                    _toggleSelection1('🌸 City Sightseeing'),
                                color: _getColor1('🌸 City Sightseeing'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, right: 16.0),
                      child: RoundButton(
                        title: 'Next',
                        onTap: () {
                          if (selectedOptions.isEmpty &&
                              selectedOptions1.isEmpty) {
                            // Show an alert dialog if no options are selected
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Selection Error"),
                                  content: const Text(
                                      "Please select at least one option!"),
                                  actions: [
                                    TextButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Print selected options
                            print("Selected Hobbies: $selectedOptions");
                            print(
                                "Selected Traveling Options: $selectedOptions1");

                            // Navigate to the next screen
                            Get.to(const WavyLineScreen6());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
