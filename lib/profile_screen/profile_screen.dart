import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
        backgroundColor: const Color(0xffFFFCEF),
        body: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  right: -200,
                  // left: screenWidth * 0.7,
                  // top: 50,
                  // left: -220,
                  child: Image.asset('assets/images/imgProfile.png',

                      // Replace with your image path
                      fit: BoxFit.fitHeight),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/logo/N.svg',
                            ),
                          ),
                          SizedBox(
                            width: mediaQuery.size.width / 2,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/like.svg',
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/logo/message-text.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * .1),
                              child: Image.asset('assets/images/profileImg.png',
                                  width: screenWidth * .29,
                                  height: screenHeight * .15,
                                  fit: BoxFit.cover)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            // Profile Name
            const Text(
              'Vasu',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000)),
            ),
            // Profile basic Info
            const Text(
              'Flutter Developer',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000)),
            ),
            // code for follow and message button
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Follow',
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff000000),
                      backgroundColor: const Color(0xff0C8CE9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(125, 40),
                      side:
                          const BorderSide(color: Color(0xff000000), width: 2),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Messages',
                      style: TextStyle(color: Color(0xff000000)),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff000000),
                      backgroundColor: const Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(125, 40),
                      side:
                          const BorderSide(color: Color(0xff000000), width: 2),
                    ),
                  ),
                ],
              ),
            ),
            // code for Hobby section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff9ED6FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Hobbies',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
