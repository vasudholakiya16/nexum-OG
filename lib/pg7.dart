import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/progress_controller_6.dart';
import 'package:flutter_application_2/HomePage/home.dart';
import 'package:flutter_application_2/wavePointer.dart';
import 'package:get/get.dart';

class WavyLineScreen6 extends StatefulWidget {
  const WavyLineScreen6({super.key});

  @override
  _WavyLineScreen6State createState() => _WavyLineScreen6State();
}

class _WavyLineScreen6State extends State<WavyLineScreen6> {
  final ProgressController6 progressController = Get.put(ProgressController6());

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 232),
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "You're shining brighter than the \nstars today!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.26,
            right: screenWidth * 1.0,
            child: Container(
              width: 500,
              height: 100,
              child: Obx(() => CustomPaint(
                    painter: WavyLinePainter(
                      progressController.progress.value,
                      amplitude: 100.0,
                      frequency: 2.0,
                      color: Colors.black,
                      storkwidth: 20.0,
                    ),
                  )),
            ),
          ),
          Positioned(
            top: screenHeight * 0.7,
            right: screenWidth * 0.1,
            child: Container(
              width: 500,
              height: 100,
              child: Obx(() => CustomPaint(
                    painter: WavyLinePainter(
                      progressController.progress.value,
                      amplitude: 70.0,
                      frequency: 2.0,
                      color: Colors.black,
                      storkwidth: 20.0,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
