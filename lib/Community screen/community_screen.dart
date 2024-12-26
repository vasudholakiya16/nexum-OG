import 'package:flutter/material.dart';
import 'package:flutter_application_2/Community%20screen/community_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
        backgroundColor: Color(0xffFFFCEF),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // code for navigation bar
              Row(
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
                      'assets/logo/notification.svg',
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
              // code for community
              const Text(
                "Community",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Generate list view builder for community
              Expanded(
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
                        color: cardColor, // Set background color of the Card
                        elevation: 4.0,

                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        child: ListTile(
                          title: Text(
                            communityTitle[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            communitySubtitle[index],
                            style: TextStyle(color: Colors.grey),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(communityImage[index]),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
