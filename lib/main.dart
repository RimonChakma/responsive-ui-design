import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCardScreen(),
    );
  }
}

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget buildTabIcon(String path, int index, double size) {
    return Image.asset(
      path,
      height: size,
      width: size,
      color: tabController.index == index ? Colors.blue : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabIcon = [
      "assets/home.png",
      "assets/video.png",
      "assets/people.png",
      "assets/profile.png",
      "assets/notification.png",
      "assets/menu.png"
    ];

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isLargeScreen = screenWidth > 600;

    double maxContainerWidth = isLargeScreen ? min(screenWidth * 0.85, 800) : double.infinity;
    double iconSize = isLargeScreen ? 30 : 24;
    double radius = isLargeScreen ? 28 : 22;
    double text1 = isLargeScreen ? 30 : 22;
    double storyWidth = min(screenWidth * 0.25, 120);
    double storyTextSize = isLargeScreen ? 14 : 12;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxContainerWidth),
        child: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "facebook",
                    style: TextStyle(
                        fontSize: text1, color: Colors.blue, fontWeight: FontWeight.w900),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/search.png", height: iconSize, width: iconSize),
                      ),
                      SizedBox(width: 5),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/messenger.png", height: iconSize, width: iconSize),
                      ),
                    ],
                  )
                ],
              ),

            ),

          ),
        ),
      ),
    );
  }
}
