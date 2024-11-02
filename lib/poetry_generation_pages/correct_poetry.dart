import 'package:allam_challenge/poetry_generation_pages/create_poetry.dart';
import 'package:allam_challenge/poetry_generation_pages/generate_poetry.dart';
import 'package:allam_challenge/prompts.dart';
import 'package:allam_challenge/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../coding_files/color_pallete.dart';
import '../coding_files/shared.dart';

class CorrectPoetry extends StatefulWidget {
  const CorrectPoetry({super.key});

  @override
  State<CorrectPoetry> createState() => _CorrectPoetryState();
}

bool allBtn = true,
    linguisticallyBtn = false,
    grammaticallyBtn = false,
    rhymeBtn = false;
String catText = "";

class _CorrectPoetryState extends State<CorrectPoetry> {
  TextEditingController _textController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/revision.png"),
                        width: 83,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "تصحيح الشعر",
                        style: TextStyle(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? whiteColor
                              : mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 24 + extraFontSize,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        "قم بوضع الشعر الذي تريد تصحيح وإعادة كتابته.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? whiteColor
                              : mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 15 + extraFontSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _textController,
                          maxLines: 10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(34.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor:
                                  context.watch<ThemeProvider>().isDarkMode
                                      ? whiteColor
                                      : mainBegiColor
                                          .withOpacity(0.5)
                                          .withOpacity(0.3),
                              hintText:
                                  "مثال : أحببتُ السماء لأنها عاليةٌ وفيها النجوم تبدو ساطعةٌ والقمر يجلس وحيدًا فيها ويفكر في الأرض وهو متعبٌ"),
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 15 + extraFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "تصحيح الأبيات",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: context.watch<ThemeProvider>().isDarkMode
                          ? whiteColor
                          : mainGreenColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 15 + extraFontSize,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      tagsBtn("الكل", allBtn ? mainGreenColor : whiteColor,
                          allBtn ? mainBegiColor : mainGreenColor, () {
                        setState(() {
                          allBtn = true;
                          linguisticallyBtn = false;
                          grammaticallyBtn = false;
                          rhymeBtn = false;
                          // catText = "اللغوية والنحوية والقافية";
                          // catText = "لغوياً ونحوياً وقافية";
                          catText = "الشعر كاملاُ";
                        });
                      }),
                      tagsBtn(
                          "لغوياً",
                          linguisticallyBtn ? mainGreenColor : whiteColor,
                          linguisticallyBtn ? mainBegiColor : mainGreenColor,
                          () {
                        setState(() {
                          allBtn = false;
                          linguisticallyBtn = true;
                          grammaticallyBtn = false;
                          rhymeBtn = false;
                          catText = "لغوياً";
                        });
                      }),
                      tagsBtn(
                          "نحوياً",
                          grammaticallyBtn ? mainGreenColor : whiteColor,
                          grammaticallyBtn ? mainBegiColor : mainGreenColor,
                          () {
                        setState(() {
                          allBtn = false;
                          linguisticallyBtn = false;
                          grammaticallyBtn = true;
                          rhymeBtn = false;
                          catText = "نحوياً";
                        });
                      }),
                      tagsBtn("قـافية", rhymeBtn ? mainGreenColor : whiteColor,
                          rhymeBtn ? mainBegiColor : mainGreenColor, () {
                        setState(() {
                          allBtn = false;
                          linguisticallyBtn = false;
                          grammaticallyBtn = false;
                          rhymeBtn = true;
                          // catText = "القافية";
                          catText = "قافية";
                        });
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBegiColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        if (_textController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "لا يمكن ترك حقل الادخال فارغاً",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w600,
                              fontSize: 15 + extraFontSize,
                            ),
                          )));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GeneratePoetry(
                                  generatedText:
                                      // "اعد صياغة النص الشعري ${_textController.text} بمعايير التصحيح $catText",
                                      Prompts.correctPoem(
                                          text: _textController.text,
                                          basedOn: catText)),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "تصحيح",
                        style: TextStyle(
                          color: mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 26 + extraFontSize,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "إلغاء",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: context.watch<ThemeProvider>().isDarkMode
                              ? whiteColor
                              : mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 15 + extraFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tagsBtn(
    String title,
    Color clr,
    Color bgclr,
    Function() fun,
  ) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: clr, width: 3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgclr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: fun,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: clr,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w800,
            fontSize: 15 + extraFontSize,
          ),
        ),
      ),
    );
  }
}
