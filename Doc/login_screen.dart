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
      body: Center(child: Container(
        constraints: BoxConstraints(maxWidth: 500),
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: screenSize.height * 0.05,),
            Text("WellCome Back!",style: TextStyle(fontSize: isTitle),),
            SizedBox(height: 8,),
            Text("Login to continue",style: TextStyle(fontSize: isSubtitle,color: Colors.grey[600]),),
            SizedBox(height: 32,),
            Text("Email",style: TextStyle(fontSize: inputFont),),
              const SizedBox(height: 8),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Enter your email"
            ),),
              const SizedBox(height: 20),
            Text("Password",style: TextStyle(fontSize: inputFont),),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              hintText: "Enter your password"
            ),),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              ), child: Text("Login",style: TextStyle(fontSize: buttonFont),)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have you account?",style: TextStyle(fontSize: inputFont),),
              TextButton(onPressed: (){}, child: Text("sign up",style: TextStyle(fontSize: inputFont),))
            ],)
          ],),
        ),
      ),),
    );
  }
}
