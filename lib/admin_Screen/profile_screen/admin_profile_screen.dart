import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  List<String> selectedOptions = [];
  List<String> selectedOptions1 = [];
  List<bool> selectedOptions2 = [true, false];
  List<bool> selectedIcons = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
        backgroundColor: const Color(0xffFFFCEF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    right: -200,
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
                                'assets/logo/settings.svg',
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/logo/logout.svg',
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
                                child: Image.asset(
                                    'assets/images/profileImg.png',
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
              SizedBox(height: 10),

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
                                        "assets/logo/community.png",
                                        fit: BoxFit.cover,
                                      ),
                                      const Text('Communities'),
                                    ],
                                  ),
                                  if (selectedOptions2[0])
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 2,
                                      width:
                                          50, // Adjust width of the underline
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
                                        "assets/logo/post.png",
                                        fit: BoxFit.cover,
                                      ),
                                      const Text('Posts'),
                                    ],
                                  ),
                                  if (selectedOptions2[1])
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 2,
                                      width:
                                          60, // Adjust width of the underline
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.6, // Constrain height
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // This sets the number of columns in the grid
                            crossAxisSpacing:
                                10.0, // Horizontal spacing between grid items
                            mainAxisSpacing:
                                10.0, // Vertical spacing between grid items
                            childAspectRatio:
                                1.0, // Adjust the aspect ratio of each grid item
                          ),
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

                            // Set a green color for the card background
                            Color cardColor = const Color(
                                0xffFFFCEF); // This is a shade of green
                            Color textColor =
                                Colors.black; // White text for contrast

                            return GestureDetector(
                              onTap: () {
                                print("Tapped on ${communityTitle[index]}");
                                // Get.to(const CommunityPage());
                              },
                              child: Card(
                                color:
                                    cardColor, // Set background color of the Card
                                elevation: 4.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          image:
                                              AssetImage(communityImage[index]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          communityTitle[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                textColor, // Change text color to white for better contrast
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Unofficial',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    if (selectedOptions2[1])
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.6, // Constrain height
                        child: ListView.builder(
                          itemCount:
                              1, // You can increase this number based on the number of sections in the list.
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                // First Section: User Info and More Button
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffFFD700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Ellie johnson',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: screenHeight * 0.04,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color: Color(0xffFFD700),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  17)),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'PIET',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff0D0D10),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                'Projections’24',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff595854),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16.0,
                                                    right: 16.0,
                                                    left: 16.0),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffFFFCEF),
                                                    border: Border(
                                                      top: BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          width: 2),
                                                      left: BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          width: 2),
                                                      right: BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          width: 7),
                                                      bottom: BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          width: 4),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        title: const Text(
                                                            'Report'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          ExitDialog.show(
                                                              context);
                                                        },
                                                      ),
                                                      const Divider(
                                                        color: Colors.black,
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Unfollow'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          Unfollow.show(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Color(0xffFFFCEF),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: const Border(
                                              top: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                width: 1,
                                              ),
                                              left: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  width: 1),
                                              right: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  width: 4),
                                              bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                width: 5,
                                              ),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.more_horiz_rounded,
                                            color: Color(0xff0D0D10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset("assets/images/img.png"),

                                // Second Section: Like, Comment, Share Buttons
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedIcons[1] =
                                                    !selectedIcons[1];
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  selectedIcons[1]
                                                      ? 'assets/images/star_2.png'
                                                      : "assets/images/star_11.png",
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const Text("Like",
                                                    style: TextStyle(
                                                      color: Color(0xff000000),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              CommentPostBottomSheet.show(
                                                  context);
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/message-2.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const Text("Comment",
                                                    style: TextStyle(
                                                      color: Color(0xff000000),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              SharePostBottomSheet.show(
                                                  context);
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/send-2.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const Text("Share",
                                                    style: TextStyle(
                                                      color: Color(0xff000000),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIcons[2] =
                                                !selectedIcons[2];
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              selectedIcons[2]
                                                  ? 'assets/images/frame_1.png'
                                                  : "assets/images/frame.png",
                                              height: 30,
                                              width: 30,
                                            ),
                                            const Text("Save",
                                                style: TextStyle(
                                                  color: Color(0xff000000),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Third Section: Text Below Image
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  child: Text(
                                    "ellie.joohnson23: Claudia still missing the event carnival, promising her to buy tickets this time #claudia #projections @krrizzzy",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )

                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 20, top: 20),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Container(
                    //                 height: 40,
                    //                 width: 40,
                    //                 decoration: const BoxDecoration(
                    //                   shape: BoxShape.circle,
                    //                   color: Color(0xffFFD700),
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Column(
                    //                 // mainAxisAlignment: MainAxisAlignment.center,
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Row(
                    //                     children: [
                    //                       const Text(
                    //                         'Ellie johnson',
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //                           fontWeight: FontWeight.bold,
                    //                         ),
                    //                       ),
                    //                       const SizedBox(
                    //                         width: 10,
                    //                       ),
                    //                       Container(
                    //                         width: screenHeight * 0.04,
                    //                         decoration: const BoxDecoration(
                    //                           shape: BoxShape.rectangle,
                    //                           color: Color(0xffFFD700),
                    //                           borderRadius: BorderRadius.all(
                    //                               Radius.circular(17)),
                    //                         ),
                    //                         child: const Center(
                    //                           child: Text(
                    //                             'PIET',
                    //                             style: TextStyle(
                    //                               fontSize: 12,
                    //                               color: Color(0xff0D0D10),
                    //                               fontWeight: FontWeight.bold,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   const Text(
                    //                     'Projections’24',
                    //                     style: TextStyle(
                    //                       fontSize: 12,
                    //                       color: Color(0xff595854),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           TextButton(
                    //               onPressed: () {
                    //                 showModalBottomSheet(
                    //                   backgroundColor: Colors.transparent,
                    //                   context: context,
                    //                   builder: (BuildContext context) {
                    //                     return Padding(
                    //                       padding: const EdgeInsets.only(
                    //                           top: 16.0,
                    //                           right: 16.0,
                    //                           left: 16.0),
                    //                       child: Container(
                    //                         decoration: const BoxDecoration(
                    //                           color: Color(
                    //                               0xffFFFCEF), // Background color of the container
                    //                           border: Border(
                    //                             top: BorderSide(
                    //                                 color: Color.fromARGB(
                    //                                     255, 0, 0, 0),
                    //                                 width: 2),
                    //                             left: BorderSide(
                    //                                 color: Color.fromARGB(
                    //                                     255, 0, 0, 0),
                    //                                 width: 2),
                    //                             right: BorderSide(
                    //                                 color: Color.fromARGB(
                    //                                     255, 0, 0, 0),
                    //                                 width: 7),
                    //                             bottom: BorderSide(
                    //                                 color: Color.fromARGB(
                    //                                     255, 0, 0, 0),
                    //                                 width: 4),
                    //                           ),
                    //                           borderRadius: BorderRadius.only(
                    //                             topLeft: Radius.circular(20),
                    //                             topRight: Radius.circular(20),
                    //                           ), // Circular border
                    //                         ),
                    //                         height: 150,
                    //                         // color: Colors.white,
                    //                         child: Column(
                    //                           children: [
                    //                             ListTile(
                    //                               title: const Text('Report'),
                    //                               onTap: () {
                    //                                 Navigator.pop(context);
                    //                                 ExitDialog.show(context);
                    //                               },
                    //                             ),
                    //                             const Divider(
                    //                               color: Colors.black,
                    //                             ),
                    //                             ListTile(
                    //                               title:
                    //                                   const Text('Unfollow'),
                    //                               onTap: () {
                    //                                 Navigator.pop(context);
                    //                                 Unfollow.show(context);
                    //                               },
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     );
                    //                   },
                    //                 );
                    //               },
                    //               child: Container(
                    //                 height: 30,
                    //                 width: 30,
                    //                 decoration: BoxDecoration(
                    //                   shape: BoxShape.rectangle,
                    //                   color: Color(0xffFFFCEF),
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   border: const Border(
                    //                     top: BorderSide(
                    //                       color: Color.fromARGB(255, 0, 0, 0),
                    //                       width: 1,
                    //                     ),
                    //                     left: BorderSide(
                    //                         color:
                    //                             Color.fromARGB(255, 0, 0, 0),
                    //                         width: 1),
                    //                     right: BorderSide(
                    //                         color:
                    //                             Color.fromARGB(255, 0, 0, 0),
                    //                         width: 4),
                    //                     bottom: BorderSide(
                    //                       color: Color.fromARGB(255, 0, 0, 0),
                    //                       width: 5,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 child: const Icon(
                    //                   Icons.more_horiz_rounded,
                    //                   color: Color(0xff0D0D10),
                    //                 ),
                    //               )),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       height: 10,
                    //     ),
                    //     Image.asset("assets/images/img.png"),

                    //     // code for like and comment

                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 20, top: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               TextButton(
                    //                 onPressed: () {
                    //                   setState(() {
                    //                     selectedIcons[1] = !selectedIcons[1];
                    //                   });
                    //                 },
                    //                 child: Column(
                    //                   children: [
                    //                     Image.asset(
                    //                       selectedIcons[1]
                    //                           ? 'assets/images/star_2.png'
                    //                           : "assets/images/star_11.png",
                    //                       height: 30,
                    //                       width: 30,
                    //                     ),
                    //                     const Text("Like",
                    //                         style: TextStyle(
                    //                           color: Color(0xff000000),
                    //                         )),
                    //                   ],
                    //                 ),
                    //                 // onPressed: () { message-2
                    //               ),
                    //               TextButton(
                    //                 onPressed: () {
                    //                   CommentPostBottomSheet.show(context);
                    //                   // CommentPostBottomSheet.show(context);
                    //                 },
                    //                 child: Column(
                    //                   children: [
                    //                     Image.asset(
                    //                       'assets/images/message-2.png',
                    //                       height: 30,
                    //                       width: 30,
                    //                     ),
                    //                     const Text("Comment",
                    //                         style: TextStyle(
                    //                           color: Color(0xff000000),
                    //                         )),
                    //                   ],
                    //                 ),
                    //               ),
                    //               TextButton(
                    //                 onPressed: () {
                    //                   SharePostBottomSheet.show(context);
                    //                 },
                    //                 child: Column(
                    //                   children: [
                    //                     Image.asset(
                    //                       'assets/images/send-2.png',
                    //                       height: 30,
                    //                       width: 30,
                    //                     ),
                    //                     const Text("Share",
                    //                         style: TextStyle(
                    //                           color: Color(0xff000000),
                    //                         )),
                    //                   ],
                    //                 ),
                    //                 // onPressed: () { frame
                    //               ),
                    //             ],
                    //           ),
                    //           TextButton(
                    //             onPressed: () {
                    //               setState(() {
                    //                 selectedIcons[2] = !selectedIcons[2];
                    //               });
                    //             },
                    //             child: Column(
                    //               children: [
                    //                 Image.asset(
                    //                   selectedIcons[2]
                    //                       ? 'assets/images/frame_1.png'
                    //                       : "assets/images/frame.png",
                    //                   height: 30,
                    //                   width: 30,
                    //                 ),
                    //                 const Text("Save",
                    //                     style: TextStyle(
                    //                       color: Color(0xff000000),
                    //                     )),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),

                    //     // Add some text below the image
                    //     const Text(
                    //       "ellie.joohnson23: Claudia still missing the event carnival, promising her to buy tickets this time #claudia #projections @krrizzzy",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Color(0xff000000),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height *
                    //       0.6, // Constrain height
                    //   child: ListView.builder(
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) {
                    //       List<String> communityImage = [
                    //         'assets/images/Rectangle 195.png',
                    //         'assets/images/Rectangle 196.png',
                    //         'assets/images/Rectangle 195.png',
                    //         'assets/images/Rectangle 196.png',
                    //         'assets/images/Rectangle 195.png',
                    //       ];
                    //       List<String> communityTitle = [
                    //         'GDSC-PU',
                    //         'AWS-PU',
                    //         'GDSC-PU',
                    //         'AWS-PU',
                    //         'GDSC-PU',
                    //       ];
                    //       List<String> communitySubtitle = [
                    //         'Google developers student club is a club for students in which',
                    //         'Amazon web services',
                    //         'Google developers student club is a club for students in which',
                    //         'Amazon web services',
                    //         'Google developers student club is a club for students in which',
                    //       ];

                    //       Color cardColor = Color(0xffFFFFFF);

                    //       return GestureDetector(
                    //         onTap: () {
                    //           print("Tapped on ${communityTitle[index]}");
                    //           // Get.to(const CommunityPage());
                    //         },
                    //         child: Card(
                    //           color:
                    //               cardColor, // Set background color of the Card
                    //           elevation: 4.0,
                    //           margin: const EdgeInsets.symmetric(
                    //               vertical: 8.0, horizontal: 10.0),
                    //           child: ListTile(
                    //             title: Text(
                    //               communityTitle[index],
                    //               style: const TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //             subtitle: Text(
                    //               communitySubtitle[index],
                    //               style: const TextStyle(color: Colors.grey),
                    //             ),
                    //             leading: CircleAvatar(
                    //               backgroundImage:
                    //                   AssetImage(communityImage[index]),
                    //             ),
                    //             trailing: const Icon(Icons.arrow_forward_ios),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),

              // Column(
              //   children: [
              //     // ToggleButtons for selection
              //     ToggleButtons(
              //       isSelected: selectedOptions2,
              //       onPressed: (int index) {
              //         setState(() {
              //           // Deselect all options and then select the clicked one
              //           selectedOptions2 = [false, false];
              //           selectedOptions2[index] = true;
              //         });
              //       },
              //       borderWidth: 0, // Remove the border width
              //       selectedBorderColor:
              //           Colors.transparent, // Make selected border transparent
              //       borderColor:
              //           Colors.transparent, // Remove border color entirely
              //       fillColor: Colors
              //           .transparent, // Optional: Set fill color to transparent if needed
              //       color:
              //           Colors.black, // You can adjust the text color as needed
              //       selectedColor: Colors.grey,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 40, left: 40),
              //           child: Row(
              //             children: [
              //               Image.asset(
              //                 "assets/images/post.png",
              //                 fit: BoxFit.cover,
              //               ),
              //               Text('Posts'),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 40, right: 40),
              //           child: Row(
              //             children: [
              //               Image.asset(
              //                 "assets/images/tagged.png",
              //                 fit: BoxFit.cover,
              //               ),
              //               Text('Tagged'),
              //             ],
              //           ),
              //         ),
              //       ], // Color for selected option
              //     ),

              //     SizedBox(height: 20),

              //     // Show content based on the selected option
              //     if (selectedOptions2[0])
              //       Column(
              //         children: [
              //           Text('You selected Option 1'),
              //           Image.asset('assets/images/profileImg.png'),
              //         ],
              //       ),

              //     if (selectedOptions2[1])
              //       Column(
              //         children: [
              //           Text('You selected Option 2'),
              //           Image.asset('assets/images/profileImg.png'),
              //           Image.asset('assets/images/profileImg.png'),
              //         ],
              //       ),
              //   ],
              // )
            ],
          ),
        ));
  }
}

class GridViewPage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"image": "assets/image1.jpg", "text": "Item 1"},
    {"image": "assets/image2.jpg", "text": "Item 2"},
    {"image": "assets/image3.jpg", "text": "Item 3"},
    {"image": "assets/image4.jpg", "text": "Item 4"},
    {"image": "assets/image5.jpg", "text": "Item 5"},
    {"image": "assets/image6.jpg", "text": "Item 6"},
    // Add more items as necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView with Image and Text"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  data[index]["image"]!, // Load image from assets
                  width: 100, // Set image width
                  height: 100, // Set image height
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),
                Text(
                  data[index]["text"]!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// CODE FOR Unfollow Dialog

class Unfollow extends StatefulWidget {
  const Unfollow({Key? key}) : super(key: key);

  @override
  _UnfollowState createState() => _UnfollowState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Unfollow();
      },
    );
  }
}

class _UnfollowState extends State<Unfollow> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.black, // Border color
          width: 5, // Border width
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context); // Close exit dialog
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
          const Column(
            children: [
              Text(
                "Unfollow \n @ellie.johnson23?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "User Report: Multiple users have flagged concerns regarding missed events and delayed ticket purchases.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the current dialog
                },
                child: const Text(
                  "Send Report!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// CODE FOR Report Dialog

class ExitDialog extends StatefulWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  _ExitDialogState createState() => _ExitDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ExitDialog();
      },
    );
  }
}

class _ExitDialogState extends State<ExitDialog> {
  // Function to show the success dialog after the report is sent
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.black, // Border color
              width: 5, // Border width
            ),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_sharp,
                color: Colors.black,
                size: 50,
              ),
              SizedBox(height: 16),
              Text(
                "Report Sent",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "khao peeo khush rahi paaji, zindagi badi choti h, kab tk ye sab krte rahoge!",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close success dialog
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.black, // Border color
          width: 5, // Border width
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context); // Close exit dialog
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
          Column(
            children: [
              // Image widget
              Image.asset(
                'assets/images/warning-2.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 16),
              const Text(
                "Report!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "User Report: Multiple users have flagged concerns regarding missed events and delayed ticket purchases.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the current dialog
                  _showSuccessDialog(context); // Show success dialog
                },
                child: const Text(
                  "Send Report!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// CODE FOR Share the Post

class SharePostBottomSheet extends StatefulWidget {
  const SharePostBottomSheet({Key? key}) : super(key: key);

  @override
  _SharePostBottomSheetState createState() => _SharePostBottomSheetState();

  // Static method to show the SharePostBottomSheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 16.0, right: 16.0, left: 16.0), // Padding around the content
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffFFFCEF), // Background color of the container
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                right:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 7),
                bottom:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ), // Circular border
            ),
            child: const SharePostBottomSheet(),
          ),
        );
      },
    );
  }
}

class _SharePostBottomSheetState extends State<SharePostBottomSheet> {
  List<bool> _selectedItems = List.generate(13, (index) => false);

  TextEditingController _controller = TextEditingController();

  void _shareMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      Share.share(message); // Using share_plus to share the message
    } else {
      // Optionally, show a message if the text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a message to share")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: Color(0xff313134),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Share Post',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 7.0,
                childAspectRatio: 3.5,
              ),
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                List<String> titles = [
                  'Vasu',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Vasu',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Jay',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Jay',
                ];

                List<String> imagePaths = [
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                ];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItems[index] = !_selectedItems[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffBFBDB3), // Set the color of the border
                        width: 1.0, // Set the width of the border
                      ),
                      color: _selectedItems[index]
                          ? Colors.black
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            imagePaths[
                                index], // Display the image from the list
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                              width:
                                  8), // Optional space between image and text
                          Text(
                            titles[index],
                            style: TextStyle(
                              color: _selectedItems[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffBFBDB3),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search field
                  Container(
                    width: screenWidth * 0.5,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  // IconButton for sharing the message
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _shareMessage, // Share function when clicked
                    color: const Color.fromARGB(
                        255, 82, 81, 79), // Optional: Customize color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CODE FOR Comment the Post

class CommentPostBottomSheet extends StatefulWidget {
  const CommentPostBottomSheet({Key? key}) : super(key: key);

  @override
  _CommentPostBottomSheetState createState() => _CommentPostBottomSheetState();

  // Static method to show the SharePostBottomSheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 16.0, right: 16.0, left: 16.0), // Padding around the content
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffFFFCEF), // Background color of the container
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                right:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 7),
                bottom:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ), // Circular border
            ),
            child: const CommentPostBottomSheet(),
          ),
        );
      },
    );
  }
}

class _CommentPostBottomSheetState extends State<CommentPostBottomSheet> {
  List<bool> _selectedItems = List.generate(13, (index) => false);

  TextEditingController _controller = TextEditingController();

  void _shareMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      Share.share(message); // Using share_plus to share the message
    } else {
      // Optionally, show a message if the text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a message to share")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Comments',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff313134),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 3.5,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                List<String> titles = [
                  'Vasu',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Vasu',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Jay',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Jay',
                ];
                List<String> colTitle = [
                  'Vasu',
                  'Het',
                  'Ashish',
                  'Pinkesh',
                  'Vasu',
                ];
                List<String> comments = [
                  'Claudias new hobby: collecting excuses instead of carnival tickets. 🤷‍♂️',
                  'Claudia should write a guide: ‘How to Miss Every Carnival—A Masterclass',
                  'He wants to eat me, devour me, break me and lick than anybody else ',
                  'people might think imma fake id, but who gives a crap?',
                  'I’ll make sure all the bad girls are handcuffed and beaten by me carefully #MeToo',
                ];

                List<String> likes = [
                  '789',
                  '896',
                  '852',
                  '741',
                  '789',
                ];

                List<String> imagePaths = [
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                  'assets/images/frame_1.png',
                ];

                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   _selectedItems[index] = !_selectedItems[index];
                    // });
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            imagePaths[
                                index], // Display the image from the list
                            height: 30,
                            width: 30,
                          ),
                          Container(
                            width: screenWidth * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  colTitle[index],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        8), // Optional space between image and text
                                Text(
                                  comments[index],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines:
                                      null, // Allows the text to wrap to multiple lines.
                                  overflow: TextOverflow
                                      .visible, // Ensures text shows in the next line.
                                ),
                                Row(
                                  children: [
                                    Text(
                                      likes[index],
                                      style: const TextStyle(
                                        color: Color(0xff595854),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      likes[index],
                                      style: const TextStyle(
                                        color: Color(0xff595854),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              // add two icons
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedItems[index] =
                                        !_selectedItems[index];
                                  });
                                },
                                icon: Icon(
                                  _selectedItems[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _selectedItems[index]
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              // add comment icon
                              IconButton(
                                onPressed: () {
                                  // CommentPostBottomSheet.show(context);
                                },
                                icon: const Icon(
                                  Icons.comment,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffBFBDB3),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search field
                  Container(
                    width: screenWidth * 0.5,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Write a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  // IconButton for sharing the message
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _shareMessage, // Share function when clicked
                    color: const Color.fromARGB(
                        255, 82, 81, 79), // Optional: Customize color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
