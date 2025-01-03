import 'package:flutter/material.dart';

Widget buildCommunityScreen(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
  );
}
