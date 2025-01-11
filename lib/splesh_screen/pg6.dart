import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/splesh_screen/button.dart';
import 'package:flutter_application_2/controller/progress_controller_4.dart';
import 'package:flutter_application_2/splesh_screen/pg7.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _loadAllItems(); // Load all items from shared preferences
    _loadSelectedOptions();
  }

  Future<void> _loadSelectedOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedOptions = prefs.getStringList('selectedHobbies') ?? [];
      selectedOptions1 = prefs.getStringList('selectedTravels') ?? [];
    });
  }

  Future<void> _saveSelectedOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedHobbies', selectedOptions);
    await prefs.setStringList('selectedTravels', selectedOptions1);

    // Update the progress value
    progressController.progress1.value = 0.95;

    // print the _saveSelectedOptions values
    print('Selected Hobbies: $selectedOptions');
    print('Selected Travels: $selectedOptions1');
  }

  // Random user ID generator
  String generateUserId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
          12, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  // load all item from shared preferences
  String? savedName;
  String? genderIdentity;
  String? dob;
  String? imageUrl;
  String? course;
  String? passingYear;
  String? status;

  Future<void> _loadAllItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = prefs.getString('account_status');
      savedName = prefs.getString('user_name');
      genderIdentity = prefs.getString('selected_gender');
      dob = prefs.getString('birthday');
      imageUrl = prefs.getString('dummyImage');
      course = prefs.getString('selectedCourse');
      passingYearError = prefs.getString('passingYear');
      selectedOptions = prefs.getStringList('selectedHobbies') ?? [];
      selectedOptions1 = prefs.getStringList('selectedTravels') ?? [];

      print('account_status: $status');
      print('Saved Name: $savedName');
      print('Gender Identity: $genderIdentity');
      print('Date of Birth: $dob');
      print('Image URL: $imageUrl');
      print('Course: $course');
      print('Passing Year: $passingYearError');
      print('Selected Hobbies: $selectedOptions');
      print('Selected Travels: $selectedOptions1');
    });
  }

  Future<void> _uploadDataToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = generateUserId();

    try {
      await firestore.collection('Nexum_OG').doc(userId).set({
        'status': status,
        'name': savedName,
        'gender_identity': genderIdentity,
        'dob': dob,
        'image_url': imageUrl,
        'course': course,
        'passing_year': passingYearError,
        'selected_hobbies': selectedOptions,
        'selected_travels': selectedOptions1,
        'userId': userId,
      });
      print('Data uploaded to Firestore');
    } catch (e) {
      print('Error uploading data to Firestore: $e');
    }
  }

  Future<void> _clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
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
                        onTap: () async {
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
                            // Save the selected options
                            await _saveSelectedOptions();
                            // Upload data to Firestore
                            await _uploadDataToFirestore();
                            // Clear SharedPreferences
                            await _clearSharedPreferences();
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

// import 'dart:async';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/button.dart';
// import 'package:flutter_application_2/controller/progress_controller_4.dart';
// import 'package:flutter_application_2/pg7.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class WavyLineScreen5 extends StatefulWidget {
//   const WavyLineScreen5({super.key});

//   @override
//   _WavyLineScreen5State createState() => _WavyLineScreen5State();
// }

// class _WavyLineScreen5State extends State<WavyLineScreen5> {
//   Timer? _timer;
//   final ProgressController4 progressController = Get.put(ProgressController4());
//   // String? _selectedGender;
//   String? genderError;
//   String? passingYearError;
//   // bool _isSelected = false;

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
//   void initState() {
//     super.initState();
//     _loadSelectedOptions();
//     _loadAllItems(); // Load all items from shared preferences
//   }

//   Future<void> _loadSelectedOptions() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedOptions = prefs.getStringList('selectedHobbies') ?? [];
//       selectedOptions1 = prefs.getStringList('selectedTravels') ?? [];
//     });
//   }

//   Future<void> _saveSelectedOptions() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('selectedHobbies', selectedOptions);
//     await prefs.setStringList('selectedTravels', selectedOptions1);

//     // Update the progress value
//     progressController.progress1.value = 0.95;

//     // print the _saveSelectedOptions values
//     print('Selected Hobbies: $selectedOptions');
//     print('Selected Travels: $selectedOptions1');
//   }

//   // load all item from shared preferences
//   String? savedName;
//   String? genderIdentity;
//   String? dob;
//   String? imageUrl;
//   String? course;
//   String? passingYear;
//   Future<void> _loadAllItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       savedName = prefs.getString('user_name');
//       genderIdentity = prefs.getString('gender_identity');
//       dob = prefs.getString('dob');
//       imageUrl = prefs.getString('image_url');
//       course = prefs.getString('course');
//       passingYearError = prefs.getString('passing_year');
//       _loadSelectedOptions();
//     });
//   }

//   Future<void> _uploadDataToFirebase() async {
//     final DatabaseReference database = FirebaseDatabase.instance.ref();
//     await database.child('users').child('user_id').set({
//       'name': savedName,
//       'gender_identity': genderIdentity,
//       'dob': dob,
//       'image_url': imageUrl,
//       'course': course,
//       'passing_year': passingYearError,
//       'selected_hobbies': selectedOptions,
//       'selected_travels': selectedOptions1,
//     });
//   }

//   Future<void> _clearSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 250, 232),
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             // Enable scrolling
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 50),
//                 Center(
//                   child: SizedBox(
//                     width: screenWidth / 4,
//                     child: Obx(() => LinearProgressIndicator(
//                           value: progressController.progress1.value / 1.2,
//                           backgroundColor: Colors.grey[300],
//                           color: Colors.black,
//                         )),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "We’re Interested \nin knowing about \nyou",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                     const SizedBox(height: 10),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Select at least  5 interest",
//                             style: TextStyle(
//                               color: Color(0xFF929293),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Hobbies On Free time",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Hobbies Selection
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 16.0, top: 8.0, right: 16.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🎮 Games',
//                                 onTap: () => _toggleSelection('🎮 Games'),
//                                 color: _getColor('🎮 Games'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🎧 Music',
//                                 onTap: () => _toggleSelection('🎧 Music'),
//                                 color: _getColor('🎧 Music'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🥂 Clubbing',
//                                 onTap: () => _toggleSelection('🥂 Clubbing'),
//                                 color: _getColor('🥂 Clubbing'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🎨 Painting',
//                                 onTap: () => _toggleSelection('🎨 Painting'),
//                                 color: _getColor('🎨 Painting'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '📚 Reading',
//                                 onTap: () => _toggleSelection('📚 Reading'),
//                                 color: _getColor('📚 Reading'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🍿 Movie Marathons',
//                                 onTap: () =>
//                                     _toggleSelection('🍿 Movie Marathons'),
//                                 color: _getColor('🍿 Movie Marathons'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🧁 Baking',
//                                 onTap: () => _toggleSelection('🧁 Baking'),
//                                 color: _getColor('🧁 Baking'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '💊 Cooking meth',
//                                 onTap: () =>
//                                     _toggleSelection('💊 Cooking meth'),
//                                 color: _getColor('💊 Cooking meth'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '💻 Repairing laptops',
//                                 onTap: () =>
//                                     _toggleSelection('💻 Repairing laptops'),
//                                 color: _getColor('💻 Repairing laptops'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🧑‍🤝‍🧑 Back bitchin of colleagues',
//                                 onTap: () => _toggleSelection(
//                                     '🧑‍🤝‍🧑 Back bitchin of colleagues'),
//                                 color: _getColor(
//                                     '🧑‍🤝‍🧑 Back bitchin of colleagues'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🥛 Lassi',
//                                 onTap: () => _toggleSelection('🥛 Lassi'),
//                                 color: _getColor('🥛 Lassi'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Travelling",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 16.0, top: 8.0, right: 16.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '✈️ Traveling',
//                                 onTap: () => _toggleSelection1('✈️ Traveling'),
//                                 color: _getColor1('✈️ Traveling'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🏖️ Beach Holidays',
//                                 onTap: () =>
//                                     _toggleSelection1('🏖️ Beach Holidays'),
//                                 color: _getColor1('🏖️ Beach Holidays'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🏔️ Mountain Hiking',
//                                 onTap: () =>
//                                     _toggleSelection1('🏔️ Mountain Hiking'),
//                                 color: _getColor1('🏔️ Mountain Hiking'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🌍 Exploring Cultures',
//                                 onTap: () =>
//                                     _toggleSelection1('🌍 Exploring Cultures'),
//                                 color: _getColor1('🌍 Exploring Cultures'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🚗 Road Trips',
//                                 onTap: () => _toggleSelection1('🚗 Road Trips'),
//                                 color: _getColor1('🚗 Road Trips'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🛳️ Cruises',
//                                 onTap: () => _toggleSelection1('🛳️ Cruises'),
//                                 color: _getColor1('🛳️ Cruises'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🏕️ Camping',
//                                 onTap: () => _toggleSelection1('🏕️ Camping'),
//                                 color: _getColor1('🏕️ Camping'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🌄 Adventure Sports',
//                                 onTap: () =>
//                                     _toggleSelection1('🌄 Adventure Sports'),
//                                 color: _getColor1('🌄 Adventure Sports'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '📷 Photography',
//                                 onTap: () =>
//                                     _toggleSelection1('📷 Photography'),
//                                 color: _getColor1('📷 Photography'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               SelectedOption(
//                                 title: '🥘 Culinary Tours',
//                                 onTap: () =>
//                                     _toggleSelection1('🥘 Culinary Tours'),
//                                 color: _getColor1('🥘 Culinary Tours'),
//                               ),
//                               SizedBox(width: 5),
//                               SelectedOption(
//                                 title: '🌸 City Sightseeing',
//                                 onTap: () =>
//                                     _toggleSelection1('🌸 City Sightseeing'),
//                                 color: _getColor1('🌸 City Sightseeing'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20.0),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 16.0, top: 8.0, right: 16.0),
//                       child: RoundButton(
//                         title: 'Next',
//                         onTap: () async {
//                           if (selectedOptions.isEmpty &&
//                               selectedOptions1.isEmpty) {
//                             // Show an alert dialog if no options are selected
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: const Text("Selection Error"),
//                                   content: const Text(
//                                       "Please select at least one option!"),
//                                   actions: [
//                                     TextButton(
//                                       child: const Text("OK"),
//                                       onPressed: () {
//                                         Navigator.of(context)
//                                             .pop(); // Close the dialog
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           } else {
//                             // Save the selected options
//                             await _saveSelectedOptions();
//                             // Upload data to Firebase
//                             try {
//                               await _uploadDataToFirebase();
//                               Fluttertoast.showToast(
//                                 msg: "Data uploaded successfully",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.BOTTOM,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.green,
//                                 textColor: Colors.white,
//                                 fontSize: 16.0,
//                               );
//                             } catch (e) {
//                               Fluttertoast.showToast(
//                                 msg: "Failed to upload data",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.BOTTOM,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.red,
//                                 textColor: Colors.white,
//                                 fontSize: 16.0,
//                               );
//                             }
//                             // Clear SharedPreferences
//                             await _clearSharedPreferences();
//                             // Print selected options
//                             print("Selected Hobbies: $selectedOptions");
//                             print(
//                                 "Selected Traveling Options: $selectedOptions1");

//                             // Navigate to the next screen
//                             Get.to(const WavyLineScreen6());
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
