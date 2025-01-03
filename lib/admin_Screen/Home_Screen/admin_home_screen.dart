import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/all_community.dart';
import 'package:flutter_application_2/admin_Screen/admin_Home_Page.dart/admin_Home_Page.dart';
import 'package:flutter_application_2/admin_Screen/chat_section/admin_chat_screen.dart';
import 'package:flutter_application_2/admin_Screen/profile_screen/admin_profile_screen.dart';
import 'package:flutter_application_2/controller/home_controller.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

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

    return Scaffold(
      backgroundColor: const Color(0xffFFFCEF),
      body: Obx(() {
        var navBody = [
          const AdminHomePage(),
          const AdminChatScreen(),
          const AllCommunity(),
          const AdminProfileScreen(),
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
              controller.currentNavIndex.value == 1
                  ? selectedIcons[3] // Selected icon
                  : selectedIcons[2], // Default icon
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                controller.currentNavIndex.value == 2
                    ? selectedIcons[5] // Selected icon
                    : selectedIcons[4], // Default icon
                height: 30,
                width: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              controller.currentNavIndex.value == 3
                  ? selectedIcons[6] // Selected icon
                  : selectedIcons[7], // Default icon
              height: 30,
              width: 30,
            ),
            label: '',
          ),
        ];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
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
          ),
        );
      }),
    );
  }
}
