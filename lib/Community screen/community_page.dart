import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFFCEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // code for navigation bar
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0),
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
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/logo/message-text.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          //code for image
          // Stack(
          //   children: [
          //     Positioned.fill(
          //       top: 0,
          //       right: -220,
          //       child: SvgPicture.asset(
          //         'assets/images/Star.svg',
          //         fit: BoxFit.fitHeight,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 20, top: 20),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'University Hotspots',
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 20,
          //           ),
          //           SizedBox(
          //             height: screenHeight * 0.25,
          //             child: ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               itemCount: 1,
          //               physics: BouncingScrollPhysics(),
          //               itemBuilder: (context, index) {
          //                 List<String> imagePaths = [
          //                   'assets/images/community_img_1.png',
          //                 ];

          //                 return Container(
          //                   width: screenWidth * 0.9,
          //                   decoration: BoxDecoration(
          //                     color: const Color(0xffFFFCEF),
          //                     borderRadius: BorderRadius.circular(10),
          //                     border: const Border(
          //                       top: BorderSide(
          //                         color: Color.fromARGB(255, 0, 0, 0),
          //                         width: 1,
          //                       ),
          //                       left: BorderSide(
          //                         color: Color.fromARGB(255, 0, 0, 0),
          //                         width: 1,
          //                       ),
          //                       right: BorderSide(
          //                         color: Color.fromARGB(255, 0, 0, 0),
          //                         width: 5,
          //                       ),
          //                       bottom: BorderSide(
          //                         color: Color.fromARGB(255, 0, 0, 0),
          //                         width: 7,
          //                       ),
          //                     ),
          //                   ),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.center,
          //                     children: [
          //                       Expanded(
          //                         child: ClipRRect(
          //                           borderRadius: BorderRadius.circular(10),
          //                           child: Image.asset(
          //                             imagePaths[index],
          //                             fit: BoxFit
          //                                 .fill, // Ensures the image fills the container
          //                             width: double.infinity,
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // )

          Stack(
            children: [
              // The image is rendered first
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.53, left: screenWidth * 0.05),
                child: Align(
                  alignment: Alignment.bottomLeft, // Adjust alignment as needed
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFF3D00),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0xffFF3D00), width: 1),
                    ),
                    padding:
                        const EdgeInsets.all(10.0), // Add padding for the text
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
                padding: EdgeInsets.only(
                    top: screenWidth * 0.67, left: screenWidth * 0.05),
                child: Align(
                  alignment: Alignment.bottomLeft, // Adjust alignment as needed
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

              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                child: Image.asset(
                  'assets/images/community_img.png',
                  width: screenWidth * 1.2,
                  height: screenHeight * 0.33,
                  fit: BoxFit.cover,
                ),
              ),
              // The container is rendered on top of the image
            ],
          ),

          // code for description
        ],
      ),
    );
  }
}
