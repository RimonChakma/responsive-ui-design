import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreens(),
    );
  }
}

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width > 600;

    double padding = isLargeScreen ? 30.0 : 16.0;
    double isTitle = isLargeScreen ? 33.0 : 24.0;
    double isSubtitle = isLargeScreen ? 18.0 : 14.0;
    double inputFont = isLargeScreen ? 16.0 : 14.0;
    double buttonFont = isLargeScreen ? 18.0 : 16.0;

    return Scaffold(
      body: Center(child: Text("responsive"),),
    );
  }
}
