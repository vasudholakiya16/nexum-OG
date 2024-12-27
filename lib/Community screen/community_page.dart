import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/common/description.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // Initialize selectedOptions2 in the State class
  List<bool> selectedOptions2 = [true, false];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFCEF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation bar
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFCEF),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/logo/message-text.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Image section with Stack
            SizedBox(
              height: screenHeight * 0.4,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 90,
                    right: -330,
                    child: SvgPicture.asset(
                      'assets/images/Star.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth * 0.67, left: screenWidth * 0.05),
                        child: Align(
                          alignment: Alignment
                              .bottomLeft, // Adjust alignment as needed
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFF3D00),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Color(0xffFF3D00), width: 1),
                            ),
                            padding: const EdgeInsets.all(
                                10.0), // Add padding for the text
                            child: const Text(
                              'Community',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Align(
                          alignment: Alignment
                              .bottomLeft, // Adjust alignment as needed
                          child: const Text(
                            'Community',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.27,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1, // Matches the size of the imagePaths
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              List<String> imagePaths = [
                                'assets/images/community_img_1.png',
                              ];

                              return Container(
                                width: screenWidth * 0.9,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFCEF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: const Border(
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Colors.black,
                                      width: 5,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 7,
                                    ),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imagePaths[index],
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Description Section
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DescriptionWidget(
                    fullDescription:
                        "Welcome to the Fresher's Fest, an exciting and vibrant event designed to welcome our newest members to the campus community! This festival is packed with a variety of activities, games, and entertainment to ensure that you have an unforgettable experience. Don't miss out on the fun!",
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // ToggleButtons Section
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOptions2 = [true, false];
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/post.png",
                                      fit: BoxFit.cover,
                                    ),
                                    const Text('Posts'),
                                  ],
                                ),
                                if (selectedOptions2[0])
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 2,
                                    width: 50, // Adjust width of the underline
                                    color: Colors.black, // Underline color
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOptions2 = [false, true];
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/tagged.png",
                                      fit: BoxFit.cover,
                                    ),
                                    const Text('Tagged'),
                                  ],
                                ),
                                if (selectedOptions2[1])
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 2,
                                    width: 60, // Adjust width of the underline
                                    color: Colors.black, // Underline color
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  if (selectedOptions2[0])
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                screenHeight * 0.3, // Adjust height as needed
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, // Number of columns
                                crossAxisSpacing: 7, // Spacing between columns
                                mainAxisSpacing: 10, // Spacing between rows
                              ),
                              itemCount: 10, // Number of images to display
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  borderOnForeground: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/profileImg.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (selectedOptions2[1])
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.6, // Constrain height
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          List<String> communityImage = [
                            'assets/images/Rectangle 195.png',
                            'assets/images/Rectangle 196.png',
                            'assets/images/Rectangle 195.png',
                            'assets/images/Rectangle 196.png',
                            'assets/images/Rectangle 195.png',
                          ];
                          List<String> communityTitle = [
                            'GDSC-PU',
                            'AWS-PU',
                            'GDSC-PU',
                            'AWS-PU',
                            'GDSC-PU',
                          ];
                          List<String> communitySubtitle = [
                            'Google developers student club is a club for students in which',
                            'Amazon web services',
                            'Google developers student club is a club for students in which',
                            'Amazon web services',
                            'Google developers student club is a club for students in which',
                          ];

                          Color cardColor = Color(0xffFFFFFF);

                          return GestureDetector(
                            onTap: () {
                              print("Tapped on ${communityTitle[index]}");
                              Get.to(const CommunityPage());
                            },
                            child: Card(
                              color:
                                  cardColor, // Set background color of the Card
                              elevation: 4.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: ListTile(
                                title: Text(
                                  communityTitle[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  communitySubtitle[index],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(communityImage[index]),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Bottom Navigation Bar
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RoundButton(
                title: 'Join',
                onTap: () {},
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
