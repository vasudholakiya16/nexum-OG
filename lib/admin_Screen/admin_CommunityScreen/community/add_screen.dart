// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/add_post_screen.dart';
// import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/add_reels_screen.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddScreen extends StatefulWidget {
//   const AddScreen({super.key});

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// int _currentIndex = 0;

// class _AddScreenState extends State<AddScreen> {
//   late PageController pageController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pageController = PageController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     pageController.dispose();
//   }

//   onPageChanged(int page) {
//     setState(() {
//       _currentIndex = page;
//     });
//   }

//   navigationTapped(int page) {
//     pageController.jumpToPage(page);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             PageView(
//               controller: pageController,
//               onPageChanged: onPageChanged,
//               children: const [
//                 AddPostScreen(),
//                 AddReelsScreen(),
//               ],
//             ),
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 300),
//               bottom: 10.h,
//               right: _currentIndex == 0 ? 100.w : 150.w,
//               child: Container(
//                 width: 120.w,
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(0);
//                       },
//                       child: Text(
//                         'Post',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 0 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(1);
//                       },
//                       child: Text(
//                         'Reels',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 1 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddScreen extends StatefulWidget {
//   const AddScreen({super.key});

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// class _AddScreenState extends State<AddScreen> {
//   late PageController pageController;
//   int _currentIndex = 0;
//   // Use `late` for variables that must be initialized before use.
//   late bool _splitScreenMode;

//   @override
//   void initState() {
//     super.initState();
//     _splitScreenMode = true; // Here you initialize it
//     print("AddScreen: initState called");
//     pageController = PageController();
//   }

//   @override
//   void dispose() {
//     print("AddScreen: dispose called");
//     pageController.dispose();
//     super.dispose();
//   }

//   void onPageChanged(int page) {
//     print("AddScreen: Page changed to $page");
//     setState(() {
//       _currentIndex = page;
//     });
//   }

//   void navigationTapped(int page) {
//     print("AddScreen: Navigation tapped for page $page");
//     pageController.jumpToPage(page);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("AddScreen: Build called with _currentIndex = $_currentIndex");
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             PageView(
//               controller: pageController,
//               onPageChanged: onPageChanged,
//               children: const [
//                 Center(child: Text('Placeholder for AddPostScreen')),
//                 Center(child: Text('Placeholder for AddReelsScreen')),
//               ],
//             ),
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 300),
//               bottom: 10.h,
//               right: _currentIndex == 0 ? 100.w : 150.w,
//               child: Container(
//                 width: 120.w,
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(0);
//                       },
//                       child: Text(
//                         'Post',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 0 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(1);
//                       },
//                       child: Text(
//                         'Reels',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 1 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddScreen extends StatefulWidget {
//   const AddScreen({super.key});

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// class _AddScreenState extends State<AddScreen> {
//   late PageController pageController;
//   int _currentIndex = 0;
//   // Changed _splitScreenMode to a nullable variable
//   bool? _splitScreenMode;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize _splitScreenMode safely
//     _splitScreenMode = true; // Initial value is set
//     print("AddScreen: initState called");
//     pageController = PageController();
//   }

//   @override
//   void dispose() {
//     print("AddScreen: dispose called");
//     pageController.dispose();
//     super.dispose();
//   }

//   void onPageChanged(int page) {
//     print("AddScreen: Page changed to $page");
//     setState(() {
//       _currentIndex = page;
//     });
//   }

//   void navigationTapped(int page) {
//     print("AddScreen: Navigation tapped for page $page");
//     pageController.jumpToPage(page);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("AddScreen: Build called with _currentIndex = $_currentIndex");

//     // If _splitScreenMode is null, show a loading screen or placeholder.
//     if (_splitScreenMode == null) {
//       return Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             PageView(
//               controller: pageController,
//               onPageChanged: onPageChanged,
//               children: const [
//                 Center(child: Text('Placeholder for AddPostScreen')),
//                 Center(child: Text('Placeholder for AddReelsScreen')),
//               ],
//             ),
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 300),
//               bottom: 10.h,
//               right: _currentIndex == 0 ? 100.w : 150.w,
//               child: Container(
//                 width: 120.w,
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(0);
//                       },
//                       child: Text(
//                         'Post',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 0 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         navigationTapped(1);
//                       },
//                       child: Text(
//                         'Reels',
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               _currentIndex == 1 ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/add_post_screen.dart';
// import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/add_reels_screen.dart';

// class AddScreen extends StatefulWidget {
//   const AddScreen({super.key});

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// int _currentIndex = 0;

// class _AddScreenState extends State<AddScreen> {
//   late final PageController pageController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pageController = PageController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     pageController.dispose();
//   }

//   onPageChanged(int page) {
//     setState(() {
//       _currentIndex = page;
//     });
//   }

//   navigationTapped(int page) {
//     pageController.jumpToPage(page);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Stack(
//         children: [
//           PageView(
//             controller: pageController,
//             onPageChanged: onPageChanged,
//             children: [
//               AddPostScreen(),
//               AddReelsScreen(),
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }
