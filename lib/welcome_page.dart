import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'poetry_generation_pages/services_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/images/khalil_logo.png",),
                height: 154,
              ),
            SizedBox(
              height: 15,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text("إِنَّ الشِعْـرَ دُرٌّ فـي القلـوب يُضيءُ،\nوميـزانٌ مـن الفِكـرِ الرشيقِ البَهِيِّ\nفَدخُـلْ إلى عـالَمِ الأبـيـاتِ وانظُــر\nكيفَ يُصـلَحُ الكـلامُ بلحظاتِ نَـديِّ",
               textAlign: TextAlign.center,
               style: TextStyle(
                color: whiteColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
                fontSize: 20,
               ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 58,
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainBegiColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: (){
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context) => ServicesPage()));
                }, 
                child: Text("الدخول",
                          style: TextStyle(
                          color: mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),),
                ),
            )
          ],
        ),
      ),
    );
  }
}