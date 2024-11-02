import 'package:allam_challenge/coding_files/shared.dart';
import 'package:allam_challenge/main.dart';
import 'package:allam_challenge/poetry_generation_pages/analyis_poetry.dart';
import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/poetry_generation_pages/correct_poetry.dart';
import 'package:allam_challenge/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_poetry.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  TextSize textSize = TextSize.medium;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? Colors.white.withOpacity(0.2)
                              : mainGreenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: whiteColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) => Container(
                                padding: const EdgeInsets.all(20),
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.black,
                                            size: 30 + extraFontSize,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "حول التطبيق",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24 + extraFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "تطبيق خليل هو مساعد ذكي يساعدك في كتابة وتحليل وتصحيح الشعر العربي",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16 + extraFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: context.watch<ThemeProvider>().isDarkMode
                                ? whiteColor
                                : mainGreenColor,
                            size: 30 + extraFontSize,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? Colors.white.withOpacity(0.2)
                              : mainGreenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (textSize == TextSize.small) {
                              textSize = TextSize.medium;
                              extraFontSize = 0;
                            } else if (textSize == TextSize.medium) {
                              textSize = TextSize.large;
                              extraFontSize = 3;
                            } else if (textSize == TextSize.large) {
                              textSize = TextSize.small;
                              extraFontSize = -3;
                            }
                            setState(() {});
                          },
                          icon: Text(
                            'ض',
                            style: TextStyle(
                              color: context.watch<ThemeProvider>().isDarkMode
                                  ? whiteColor
                                  : mainGreenColor,
                              fontWeight: fontWeightBasedOnTextSized(textSize),
                              fontSize: 20 + extraFontSize,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? Colors.white.withOpacity(0.2)
                              : mainGreenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<ThemeProvider>().toggleTheme();
                          },
                          icon: Icon(
                            context.watch<ThemeProvider>().isDarkMode
                                ? Icons.dark_mode_outlined
                                : Icons.wb_sunny_outlined,
                            color: context.watch<ThemeProvider>().isDarkMode
                                ? whiteColor
                                : mainGreenColor,
                            size: 30 + extraFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Image(
                    image: AssetImage(
                      "assets/images/khalil_logo.png",
                    ),
                    height: 129,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "خدمات التطبيق",
                      style: TextStyle(
                        color: context.watch<ThemeProvider>().isDarkMode
                            ? whiteColor
                            : mainGreenColor,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w800,
                        fontSize: 26 + extraFontSize,
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
                          style: TextStyle(
                            color: mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 24 + extraFontSize,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w400,
                            fontSize: 16 + extraFontSize,
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

  FontWeight fontWeightBasedOnTextSized(TextSize textSize) {
    if (textSize == TextSize.small) {
      return FontWeight.w300;
    } else if (textSize == TextSize.medium) {
      return FontWeight.w600;
    } else {
      return FontWeight.w800;
    }
  }
}

enum TextSize {
  small,
  medium,
  large,
}
