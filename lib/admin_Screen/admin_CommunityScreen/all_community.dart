import 'package:flutter/material.dart';

class AllCommunity extends StatefulWidget {
  const AllCommunity({super.key});

  @override
  State<AllCommunity> createState() => _AllCommunityState();
}

class _AllCommunityState extends State<AllCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFCEF),
      body: Center(
        child: Text('AllCommunity'),
      ),
    );
  }
}
