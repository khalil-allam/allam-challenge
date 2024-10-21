import 'package:allam_challenge/poetry_generation_pages/analyis_poetry.dart';
import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/poetry_generation_pages/correct_poetry.dart';
import 'package:flutter/material.dart';

import 'create_poetry.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/images/khalil_logo.png",
                    ),
                    height: 129,
                  ),
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "خدمات التطبيق",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //buttons
                  servicesBtn(
                      "تأليف الشعر",
                      "كتابة الشعر العربي بإستخدام الذكاء الإصطناعي.",
                      "poetry_2",
                      const CreatePoetry()),
                  servicesBtn(
                      "تحليل الشعر",
                      "ضع الشعر لتحليله وتقييمه من قبل الذكاء الإصطناعي",
                      "poetry_1",
                      const AnalyisPoetry()),
                  servicesBtn(
                      "تصحيح الشعر",
                      "ضع الشعر ليتم تصحيح الشعر من الجوانب اللغوية والبلاغية",
                      "revision",
                      const CorrectPoetry()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget servicesBtn(String title, subtitle, img, Widget pageName) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: secondBegiColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pageName));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  const SizedBox(
                    width: 83,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pageName));
            },
            child: Image(
              image: AssetImage("assets/images/$img.png"),
              height: 75,
              width: 83,
            ),
          ),
        ),
      ],
    );
  }
}
