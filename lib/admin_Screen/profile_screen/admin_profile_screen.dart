import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  List<String> selectedOptions = [];
  List<String> selectedOptions1 = [];
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
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  screenHeight * 0.6, // Adjust height as needed
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing:
                                      9, // Spacing between columns
                                  mainAxisSpacing: 20, // Spacing between rows
                                ),
                                itemCount: 10, // Number of images to display
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        borderOnForeground: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/profileImg.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(height: 5),
                                      // const Text('Post Title'),
                                    ],
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
                                // Get.to(const CommunityPage());
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
