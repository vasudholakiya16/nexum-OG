import 'package:flutter/material.dart';
import 'package:flutter_application_2/pg7.dart';
import 'package:get/get.dart'; // Import GetX

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // cardColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Page1(),
      home: WavyLineScreen6(),
    );
  }
}
