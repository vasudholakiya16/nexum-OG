import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> slidersList = [
    'assets/images/Group 34213.png',
    'assets/images/Group 34213.png',
    'assets/images/Group 34213.png',
  ];

  List<bool> selectedIcons =
      List.generate(5, (index) => false); // Track selected icons for each row

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFCEF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Code For Top Navigation Bar
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
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
            ),

            // Code For Slider
            VxSwiper.builder(
              aspectRatio: 15 / 7,
              autoPlay: false,
              height: screenHeight * 0.25,
              itemCount: slidersList.length,
              enlargeCenterPage: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    slidersList[index],
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make(),
                );
              },
            ),

            // Code for Communities

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                children: [
                  Text(
                    'Communities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.14,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<String> imagePaths = [
                          'assets/images/Rectangle 195.png',
                          'assets/images/Rectangle 196.png',
                          'assets/images/Rectangle 195.png',
                          'assets/images/Rectangle 196.png',
                          'assets/images/Rectangle 195.png',
                        ];

                        return Container(
                          width: screenWidth * 0.24,
                          margin: const EdgeInsets.only(right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: screenHeight * 0.1,
                                  width: screenHeight * 0.1,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xff000000),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(imagePaths[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Code For University Hotspots

            Stack(
              children: [
                Positioned.fill(
                  top: 50,
                  left: -220,
                  child: SvgPicture.asset('assets/images/Star.svg',
                      // Replace with your image path
                      fit: BoxFit.fitHeight),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University Hotspots',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenHeight * 0.26,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            List<String> imagePaths = [
                              'assets/images/Rectangle 195.png',
                              'assets/images/Rectangle 196.png',
                              'assets/images/Rectangle 195.png',
                              'assets/images/Rectangle 196.png',
                              'assets/images/Rectangle 195.png',
                            ];
                            List<String> text = [
                              'Tea Post',
                              'Nescafe',
                              'Tea Post',
                              'Nescafe',
                              'Tea Post',
                            ];

                            return Container(
                              width: screenWidth * 0.4,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFCEF),
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                  top: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1,
                                  ),
                                  left: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 1),
                                  right: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 5),
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 7,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.34,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff000000),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(imagePaths[index]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          text[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("🔥"),
                                        Text("🔥"),
                                        Text("🔥"),
                                      ],
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
