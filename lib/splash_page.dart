import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/welcome_page.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context)=>WelcomePage()));
    });
    return Scaffold(
      backgroundColor: mainGreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/khalil_logo.png",),
              height: 266,
              ),
            Text("خليل",
            style: TextStyle(
              color: whiteColor,
              fontFamily: "ReemKufi",
              fontWeight: FontWeight.w700,
              fontSize: 90,
            ),)
          ],
        ),
      ),
    );
  }
}