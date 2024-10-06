import 'package:allam_challenge/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'create_poetry.dart';
import 'output_page.dart';


class GeneratePoetry extends StatefulWidget {
  const GeneratePoetry({super.key});

  @override
  State<GeneratePoetry> createState() => _GeneratePoetryState();
}

class _GeneratePoetryState extends State<GeneratePoetry> {

  @override
  void initState() {
    // TODO: implement initState
    print(poetryTest.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => OutputPage(
          output_text: poetryTest.toString(),
        )
       ),
      );
    });
    return Scaffold(
      backgroundColor: mainGreenColor,
      body: Center(
        child: Lottie.asset(
          lottie_petry,
          height: 250),
      ),
    );
  }
}