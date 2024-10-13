import 'package:allam_challenge/poetry_generation_pages/create_poetry.dart';
import 'package:allam_challenge/poetry_generation_pages/generate_poetry.dart';
import 'package:flutter/material.dart';

import '../coding_files/color_pallete.dart';

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
        backgroundColor: mainGreenColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
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
                          color: whiteColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text(
                        "قم بوضع الشعر الذي تريد تصحيح وإعادة كتابته.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
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
                              fillColor: whiteColor,
                              hintText:
                                  "مثال : أحببتُ السماء لأنها عاليةٌ وفيها النجوم تبدو ساطعةٌ والقمر يجلس وحيدًا فيها ويفكر في الأرض وهو متعبٌ"),
                          style: const TextStyle(
                            color: blackColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "تصحيح الأبيات",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
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
                          catText = "قـافية";
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
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "لا يمكن ترك حقل الادخال فارغاً",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GeneratePoetry(
                                generatedText:
                                    "اعد صياغة النص الشعري ${_textController.text} بمعايير التصحيح $catText",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "تصحيح",
                        style: TextStyle(
                          color: mainGreenColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
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
                      child: const Text(
                        "إلغاء",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
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
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
