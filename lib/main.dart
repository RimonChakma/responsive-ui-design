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
              bottom: TabBar(
                indicatorColor: Colors.blue,
                controller: tabController,
                tabs: List.generate(
                  tabIcon.length,
                      (index) => Tab(icon: buildTabIcon(tabIcon[index], index, iconSize)),
                ),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: radius,
                            backgroundImage: AssetImage('assets/rimon.jpeg'),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "What's on your mind?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.image_sharp, color: Colors.yellow),
                        ],
                      ),
                      Divider(color: Colors.grey,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 170,
                              child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {

                                  if (index == 0) {

                                    return Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: storyWidth,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/rimon.jpeg",
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: -20,
                                                  left: (storyWidth / 2) - 16,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: Colors.white, width: 2),
                                                      color: Colors.blue,
                                                    ),
                                                    child: Icon(Icons.add, color: Colors.white, size: 24),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 24),
                                          Text(
                                            "Create Story",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: screenWidth > 600 ? 14 : 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: storyWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/rimon.jpeg",
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                            top: 7,
                                            left: 7,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: Colors.blue, width: 2),
                                              ),
                                              child: CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage("assets/rimon.jpeg"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(color: Colors.grey,),

                    ],
                  ),
                ),
                Center(child: Text("Friends")),
                Center(child: Text("Watch")),
                Center(child: Text("Groups")),
                Center(child: Text("Gaming")),
                Center(child: Text("Menu")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
