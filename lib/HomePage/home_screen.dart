import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
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
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Code For Top Navigation Bar
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
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
            ),

            // code for feed

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Ellie johnson',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: screenHeight * 0.04,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Color(0xffFFD700),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(17)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'PIET',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff0D0D10),
                                          fontWeight: FontWeight.bold,
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
                                      top: 16.0, right: 16.0, left: 16.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(
                                          0xffFFFCEF), // Background color of the container
                                      border: Border(
                                        top: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 2),
                                        left: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 2),
                                        right: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 7),
                                        bottom: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 4),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ), // Circular border
                                    ),
                                    height: 150,
                                    // color: Colors.white,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: const Text('Report'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            ExitDialog.show(context);
                                          },
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                        ),
                                        ListTile(
                                          title: const Text('Unfollow'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Unfollow.show(context);
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
                                    width: 4),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 5,
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.more_horiz_rounded,
                              color: Color(0xff0D0D10),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/img.png"),

                // code for like and comment

                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIcons[1] = !selectedIcons[1];
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
                            // onPressed: () { message-2
                          ),
                          TextButton(
                            onPressed: () {
                              CommentPostBottomSheet.show(context);
                              // CommentPostBottomSheet.show(context);
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
                              SharePostBottomSheet.show(context);
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
                            // onPressed: () { frame
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIcons[2] = !selectedIcons[2];
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

                // Add some text below the image
                const Text(
                  "ellie.joohnson23: Claudia still missing the event carnival, promising her to buy tickets this time #claudia #projections @krrizzzy",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
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
