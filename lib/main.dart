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
      home: ProfileCardScreen(),
    );
  }
}

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width > 600;

    double padding = isLargeScreen ? 30.0 : 16.0;
    double isTitle = isLargeScreen ? 25.0 : 20.0;
    double isSubtitle = isLargeScreen ? 24.0 : 18.0;
    double description = isLargeScreen ? 16.0 : 14.0;

    double buttonSize = isLargeScreen ? 300 : 200;
    double buttonFont = isLargeScreen ? 18.0 : 16.0;

    final textAlign = isLargeScreen ? TextAlign.left : TextAlign.left;
    final avatarRadius = isLargeScreen ? 60.0 : 50.0;

    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage("assets/man.png"),
                    ),
                    SizedBox(height: 30,),
                    Text("RIMON CHAKMA",style: TextStyle(fontSize: isTitle),),
                    Text("Software Engineer Flutter",style: TextStyle(fontSize: isSubtitle,color: Colors.lightBlue),),
                    SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 60 :20),
                      child: Text("A software developer designs,creates,and maintains software for various applications and systems.They are responsible for the entire software lifecycle",style: TextStyle(
                        fontSize: description,),
                        textAlign: textAlign,
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: buttonSize,
                      child: TextButton(onPressed: (){},style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ), child: Text("Follow",style: TextStyle(fontSize: buttonFont),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
