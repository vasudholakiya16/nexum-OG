// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/HomePage/home_screen.dart';
// import 'package:flutter_application_2/about_screen/about_screen.dart';
// import 'package:flutter_application_2/controller/home_controller.dart';
// import 'package:flutter_application_2/profile_screen/profile_screen.dart';
// import 'package:flutter_application_2/search_page/search_screen.dart';
// import 'package:get/get.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Initialize Home controller
//     var controller = Get.put(HomeController());

//     return Scaffold(
//       body: Obx(() {
//         var navBody = [
//           const HomePage(),
//           const SearchScreen(),
//           const AboutScreen(),
//           const ProfileScreen(),
//           // ProfileScreenMain(user: APIs.me),
//         ];

//         return Column(
//           children: [
//             Expanded(
//               child: navBody.elementAt(controller.currentNavIndex.value),
//             ),
//           ],
//         );
//       }),
//       bottomNavigationBar: Obx(() {
//         var navbarItem = [
//           const BottomNavigationBarItem(
//             icon: Image.asset(
//               selectedIcons[1]
//                   ? 'assets/images/star_2.png'
//                   : "assets/images/star_1.png",
//               height: 30,
//               width: 30,
//             ),
//             label: '',
//           ),
//           const BottomNavigationBarItem(
//             icon: SizedBox(
//               child: Icon(
//                 Icons.favorite,
//                 size: 30.0,
//               ),
//             ),
//             label: '',
//           ),
//           const BottomNavigationBarItem(
//             icon: SizedBox(
//               child: Icon(
//                 Icons.explore,
//                 size: 30.0,
//               ),
//             ),
//             label: '',
//           ),
//           const BottomNavigationBarItem(
//             icon: SizedBox(
//               child: Icon(
//                 Icons.message_rounded,
//                 size: 30.0,
//               ),
//             ),
//             label: '',
//           ),
//           const BottomNavigationBarItem(
//             icon: SizedBox(
//               child: Icon(
//                 Icons.account_circle_outlined,
//                 size: 30.0,
//               ),
//             ),
//             label: '',
//           ),
//         ];

//         return ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//           child: BottomNavigationBar(
//             currentIndex: controller.currentNavIndex.value,
//             selectedItemColor: const Color.fromARGB(255, 143, 53, 35),
//             selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: const Color.fromARGB(255, 245, 208, 201),
//             items: navbarItem,
//             onTap: (value) {
//               controller.currentNavIndex.value = value;
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_2/HomePage/home_screen.dart';
import 'package:flutter_application_2/about_screen/about_screen.dart';
import 'package:flutter_application_2/controller/home_controller.dart';
import 'package:flutter_application_2/profile_screen/profile_screen.dart';
import 'package:flutter_application_2/search_page/search_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize Home controller
    var controller = Get.put(HomeController());

    // Define the icon images for the bottom navigation bar
    List<String> selectedIcons = [
      'assets/images/home-2_1.png',
      'assets/images/home-2.png',
      'assets/images/search.png',
      'assets/images/search_2_1.png',
      'assets/images/emoji-normal.png',
      'assets/images/emoji-normal_1.png',
      'assets/images/Group 2266.png',
      'assets/images/Group 2266_1.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Obx(() {
          var navBody = [
            const HomePage(),
            const SearchScreen(),
            const AboutScreen(),
            const ProfileScreen(),
          ];

          return Column(
            children: [
              Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
              ),
            ],
          );
        }),
        bottomNavigationBar: Obx(() {
          var navbarItem = [
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.currentNavIndex.value == 0
                    ? selectedIcons[1] // Selected icon
                    : selectedIcons[0], // Default icon
                height: 30,
                width: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.currentNavIndex.value == 0
                    ? selectedIcons[2] // Selected icon
                    : selectedIcons[3], // Default icon
                height: 30,
                width: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.currentNavIndex.value == 0
                    ? selectedIcons[4] // Selected icon
                    : selectedIcons[5], // Default icon
                height: 30,
                width: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.currentNavIndex.value == 0
                    ? selectedIcons[6] // Selected icon
                    : selectedIcons[7], // Default icon
                height: 30,
                width: 30,
              ),
              label: '',
            ),
          ];

          return ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: navbarItem,
              onTap: (value) {
                controller.currentNavIndex.value = value;
              },
            ),
          );
        }),
      ),
    );
  }
}
