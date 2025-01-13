// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/admin_Screen/auth/admin_auth.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Platform.isAndroid
//       ? await Firebase.initializeApp(
//           options: const FirebaseOptions(
//               apiKey: "AIzaSyAOfG4M9VD2IWIAuCaFPCOFNNaxeapFhQs",
//               appId: "1:288271871324:android:da17dacef4f275bd09a599",
//               messagingSenderId: "288271871324",
//               projectId: "emart-fe09a"))
//       : await Firebase.initializeApp();
//   FirebaseDatabase.instance.setPersistenceEnabled(true);
//   FirebaseDatabase.instance.setLoggingEnabled(true);

//   // await Firebase.initializeApp(
//   //   options: FirebaseOptions(
//   //     apiKey: "YOUR_API_KEY",
//   //     appId: "YOUR_APP_ID",
//   //     messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
//   //     projectId: "YOUR_PROJECT_ID",
//   //     databaseURL: "https://your-database-name.firebaseio.com",
//   //   ),
//   // );
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('testKey', 'testValue');
//     print('SharedPreferences working');
//   } catch (e) {
//     print('Error initializing SharedPreferences: $e');
//   }

//   ScreenUtil.init(
//     BoxConstraints(maxWidth: 400, maxHeight: 800),
//     designSize: Size(375, 812), // Adjust this as per your design
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       // Use GetMaterialApp instead of MaterialApp
//       showSemanticsDebugger: false,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // cardColor: Colors.white,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const AdminAuth(),
//       // home: Page1(),
//       // home: WavyLineScreen6(),
//     );
//   }
// }

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/splesh_screen/pg1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the package
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAOfG4M9VD2IWIAuCaFPCOFNNaxeapFhQs",
              appId: "1:288271871324:android:da17dacef4f275bd09a599",
              messagingSenderId: "288271871324",
              projectId: "emart-fe09a"))
      : await Firebase.initializeApp();
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  FirebaseDatabase.instance.setLoggingEnabled(true);

  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('testKey', 'testValue');
    print('SharedPreferences working');
  } catch (e) {
    print('Error initializing SharedPreferences: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil here after the widget tree is built
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Adjust this as per your design
      minTextAdapt: true, // Optional to support text scaling
    );

    return GetMaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const AdminAuth(),
      home: Page1(),
    );
  }
}
