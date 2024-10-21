import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:flutter/material.dart';

import 'splash_page.dart';


class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  @override
  Widget build(BuildContext context) {
    double screenWiedth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: mainBegiColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: screenWiedth/2.8,
              height: screenHeight - 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SplashPage())),
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/phone.png'),
            ),
          ),
        ],
      ),
    );
  }
}