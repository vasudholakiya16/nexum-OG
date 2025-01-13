import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/addReelsAndPost/add_screen.dart';
import 'package:get/get.dart';

class AllCommunity extends StatefulWidget {
  const AllCommunity({super.key});

  @override
  State<AllCommunity> createState() => _AllCommunityState();
}

class _AllCommunityState extends State<AllCommunity> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFCEF),
      body: Center(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Add your onTap functionality here
              print('Container tapped!');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: screenHeight * 0.06,
                top: screenHeight * 0.02,
                right: screenHeight * 0.06,
                bottom: screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 1,
                  ),
                  left:
                      BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                  right:
                      BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 5,
                  ),
                ),
              ),
              child: Text(
                'Community',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          GestureDetector(
            onTap: () {
              // Add your onTap functionality here
              Get.to(AddScreen());
              print('Post tapped!');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: screenHeight * 0.10,
                top: screenHeight * 0.02,
                right: screenHeight * 0.10,
                bottom: screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 1,
                  ),
                  left:
                      BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                  right:
                      BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 5,
                  ),
                ),
              ),
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
