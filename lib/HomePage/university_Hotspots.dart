import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget universityHotspots(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;
  return Stack(
    children: [
      Positioned.fill(
        top: 50,
        left: -300,
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
              height: screenHeight * 0.29,
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
                    width: screenWidth * 0.43,
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
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        right: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 5),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 7,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Column(
                            children: [
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
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xff595854),
                                  ),
                                  Text(
                                    'Near food court',
                                    style: TextStyle(
                                      color: Color(0xff595854),
                                    ),
                                  ),
                                ],
                              )
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
  );
}
