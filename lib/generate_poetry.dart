import 'package:allam_challenge/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class GeneratePoetry extends StatefulWidget {
  const GeneratePoetry({super.key});

  @override
  State<GeneratePoetry> createState() => _GeneratePoetryState();
}

class _GeneratePoetryState extends State<GeneratePoetry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreenColor,
      body: Center(
        child: Lottie.asset(
          lottie_petry,
          height: 120),
      ),
    );
  }
}