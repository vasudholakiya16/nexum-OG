import 'package:flutter/material.dart';
import 'package:flutter_application_2/button.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> selectedOptions = [];
  List<String> selectedOptions1 = [];
  final List<Color> lightColors = [
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.cyanAccent,
    Colors.redAccent,
  ];

  void _toggleSelection(String title) {
    setState(() {
      if (selectedOptions.contains(title)) {
        selectedOptions.remove(title);
      } else {
        selectedOptions.add(title);
      }
    });
  }

  Color _getColor(String title) {
    int index = [
      '🎮 Games',
      '🎧 Music',
      '🥂 Clubbing',
      '🎨 Painting',
      '📚 Reading',
      '🍿 Movie Marathons',
      '🧁 Baking',
      '💊 Cooking meth',
      '💻 Repairing laptops',
      '🧑‍🤝‍🧑 Back bitchin of colleagues',
      '🥛 Lassi'
    ].indexOf(title);

    return selectedOptions.contains(title) && index != -1
        ? lightColors[index % lightColors.length]
        : Colors.white;
  }

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: screenHeight * 0.2,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xff9ED6FF),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hobbies',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000)),
                      ),
                      Row(
                        children: [
                          SelectedOption(
                            title: '🎮 Games',
                            onTap: () => _toggleSelection('🎮 Games'),
                            color: _getColor('🎮 Games'),
                          ),
                          SizedBox(width: 5),
                          SelectedOption(
                            title: '🎧 Music',
                            onTap: () => _toggleSelection('🎧 Music'),
                            color: _getColor('🎧 Music'),
                          ),
                          SizedBox(width: 5),
                          SelectedOption(
                            title: '🥂 Clubbing',
                            onTap: () => _toggleSelection('🥂 Clubbing'),
                            color: _getColor('🥂 Clubbing'),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SelectedOption(
                            title: '🎨 Painting',
                            onTap: () => _toggleSelection('🎨 Painting'),
                            color: _getColor('🎨 Painting'),
                          ),
                          SizedBox(width: 5),
                          SelectedOption(
                            title: '📚 Reading',
                            onTap: () => _toggleSelection('📚 Reading'),
                            color: _getColor('📚 Reading'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
