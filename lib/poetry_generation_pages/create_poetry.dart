import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:flutter/material.dart';

import '../coding_files/stepper.dart';
import 'generate_poetry.dart';

int activeStep = 0;
Widget mainContainer = Container();
int textNumber = 1;
int index = 0;
String _selectedEmoji = "";
List<String> poetryTest = [];

List<String> poetryText = [
  "مهتم نوّاس بالأدب العربي ويستخدم في كتابة الأشعار أسلوب الشعر الحديث ويتميز بأشعاره الغزلية والوطنية .",
  "مهتم نوّاس بالأدب العربي ويستخدم في كتابة الأشعار أسلوب الشعر الحديث ويتميز بأشعاره الغزلية والوطنية .2",
  "مهتم نوّاس بالأدب العربي ويستخدم في كتابة الأشعار أسلوب الشعر الحديث ويتميز بأشعاره الغزلية والوطنية .3",
  "مهتم نوّاس بالأدب العربي ويستخدم في كتابة الأشعار أسلوب الشعر الحديث ويتميز بأشعاره الغزلية والوطنية .4"
];

bool previuosBtn = false;
bool nextBtn = false;

class CreatePoetry extends StatefulWidget {
  const CreatePoetry({super.key});

  @override
  State<CreatePoetry> createState() => _CreatePoetryState();
}

class _CreatePoetryState extends State<CreatePoetry> {
  TextEditingController _eventController = TextEditingController();

  void plusNumber() {
    setState(() {
      textNumber++;
      activeStep = 3;
      mainContainer = textNumberStep();
    });
  }

  void minusNumber() {
    setState(() {
      textNumber--;
      activeStep = 3;
      mainContainer = textNumberStep();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    mainContainer = poetryStep();
    poetryTest.clear();
    activeStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/poetry_2.png"),
                        width: 83,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "تأليف الشعر",
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyStepperWidget(
                  virticalPadding: 0,
                  horizontalPadding: 20,
                  currentStep: activeStep + 1,
                  numOfSteps: 4,
                  lineColor: secondBegiColor,
                  texts: const ['الشاعر', 'المناسبة', 'المشاعر', 'الأبيات'],
                  selectedColor: secondGreenColor,
                  unSelectedColor: mainBegiColor,
                  icons: const [
                    'assets/svg/user.svg',
                    'assets/svg/feather.svg',
                    'assets/svg/smile.svg',
                    'assets/svg/menu.svg',
                  ],
                  itemsAlignment: MainAxisAlignment.spaceBetween,
                  isDashedLine: false,
                  lineThickness: 6,
                  circleWidth: 40,
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Stepper Pages
                Expanded(
                  // flex: 4,
                  child: mainContainer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: activeStep == 0
                          ? previuosBtn = false
                          : previuosBtn = true,
                      child: Expanded(
                        child: SizedBox(
                          height: 58,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainBegiColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                //  if(activeStep == 0){
                                //   setState(() {
                                //     poetryTest.add("أكتب لي شعر ${"يتميز بالاسلوب الحديث والأساليب الغزلية والوطنية"} ");
                                //     mainContainer = EventStep();
                                //     activeStep = 1;
                                //   });

                                //   }
                                if (activeStep == 1) {
                                  poetryTest.removeAt(0);
                                  mainContainer = poetryStep();
                                  activeStep = 0;
                                } else if (activeStep == 2) {
                                  poetryTest.removeAt(1);
                                  mainContainer = eventStep();
                                  activeStep = 1;
                                } else if (activeStep == 3) {
                                  poetryTest.removeAt(2);
                                  mainContainer = emotionsStep();
                                  activeStep = 2;
                                }
                              });
                            },
                            child: const Text(
                              "السابق",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainGreenColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: activeStep == 0
                          ? previuosBtn = false
                          : previuosBtn = true,
                      child: const SizedBox(
                        width: 30,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 58,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainBegiColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  if (activeStep == 0) {
                                    setState(() {
                                      poetryTest
                                          .add("أكتب لي شعر ${poetryText[0]} ");
                                      mainContainer = eventStep();
                                      activeStep = 1;
                                    });
                                  } else if (activeStep == 1) {
                                    poetryTest.add(
                                        "بمناسبة ${_eventController.text} ");
                                    mainContainer = emotionsStep();
                                    activeStep = 2;
                                  } else if (activeStep == 2) {
                                    poetryTest
                                        .add("فيه مشاعر ${_selectedEmoji} ");
                                    mainContainer = textNumberStep();
                                    activeStep = 3;
                                  } else if (activeStep == 3) {
                                    poetryTest.add(
                                        "ويتكون من أبيات عددها ${textNumber.toString()} .");
                                    if (_eventController.text.isEmpty ||
                                        _eventController.text.isEmpty ||
                                        _selectedEmoji == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "الرجاء تعبئة جميع الحقول السابقة",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GeneratePoetry(
                                            generatedText:
                                                poetryText.toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              );
                            },
                            child: Text(
                              activeStep == 3 ? "إنشاء" : "التالي",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: mainGreenColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    activeStep = 0;
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget poetryStep() {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          //  height: 84,
          child: Text(
            "لدينا عدد من الشعراء الإفتراضيين ، لكل واحد منهم أسلوبه الخاص في كتابة الشعر ، أختر الشاعر الذي يتناسب مع الشعر الذي تريد أن يتم تأليفه ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: CarouselView(
            backgroundColor: Colors.transparent,
            itemExtent: 350,
            shrinkExtent: 350,
            itemSnapping: true,
            children: [0, 1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                      height: 50,
                      width: double.infinity,
                      // width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/poyteriest_1.png"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 324,
                              child: Text(
                                poetryText[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      // Text('text $i', style: TextStyle(fontSize: 16.0)
                      // ,)
                      );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget eventStep() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "اكتب تفاصيل المناسبة التي تريد أن يتم تأليف الشعر لأجلها ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _eventController,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(34.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: whiteColor,
              hintText: "مثال: بمناسبة قدوم مولودتي الجديدة ..",
            ),
            style: const TextStyle(
              color: blackColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  // bool isSelectedEmo1 = false;
  // bool isSelectedEmo2 = false;
  // bool isSelectedEmo3 = false;
  // bool isSelectedEmo4 = false;
  // bool isSelectedEmo5 = false;
  // bool isSelectedEmo6 = false;
  // bool isSelectedEmo7 = false;
  // bool isSelectedEmo8 = false;
  // bool isSelectedEmo9 = false;
  int? selectedEmoji;

  Widget emotionsStep() {
    return Column(
      children: [
        const Text(
          "إختر مشاعرك تجاه المناسبة التي أخترتها",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              iconsWidget("_smiling_face_with_heart_shaped_eyes", "حب",
                  selectedEmoji == 0, () {
                setState(() {
                  _selectedEmoji = "حب";
                  selectedEmoji = 0;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_confused", "حيرة", selectedEmoji == 1, () {
                setState(() {
                  _selectedEmoji = "حيرة";
                  selectedEmoji = 1;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_white_smiling", "تفاؤل", selectedEmoji == 2, () {
                setState(() {
                  _selectedEmoji = "تفاؤل";
                  selectedEmoji = 2;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("face_with_open_mouth", "إنبهار", selectedEmoji == 3,
                  () {
                setState(() {
                  _selectedEmoji = "إنبهار";
                  selectedEmoji = 3;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_disappointed", "إحباط", selectedEmoji == 4, () {
                setState(() {
                  _selectedEmoji = "إحباط";
                  selectedEmoji = 4;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_loudly_crying", "حزن", selectedEmoji == 5, () {
                setState(() {
                  _selectedEmoji = "حزن";
                  selectedEmoji = 5;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget(
                  "_smiling_face_with_open_mouth", "سعادة", selectedEmoji == 6,
                  () {
                setState(() {
                  _selectedEmoji = "سعادة";
                  selectedEmoji = 6;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_neutral", "تبلد", selectedEmoji == 7, () {
                setState(() {
                  _selectedEmoji = "تبلد";
                  selectedEmoji = 7;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
              iconsWidget("_pouting", "غضب", selectedEmoji == 8, () {
                setState(() {
                  _selectedEmoji = "غضب";
                  selectedEmoji = 8;
                  mainContainer = emotionsStep();
                  // activeStep = 2;
                });
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget textNumberStep() {
    return Column(
      children: [
        const Text(
          "حدد عدد الأبيات التي تريد تأليفها",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (textNumber < 10) {
                  plusNumber();
                }
              },
              child: Container(
                height: 96,
                width: 80,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: secondGreenColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 96,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              child: Center(
                child: Text(
                  textNumber.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: blackColor,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (textNumber > 1) {
                  minusNumber();
                }
              },
              child: Container(
                height: 96,
                width: 80,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: secondGreenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget iconsWidget(
      String icn, String txt, bool isSelectedEmo, Function() fun) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: 96,
        width: 96,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(22),
            border: isSelectedEmo == true
                ? Border.all(color: secondGreenColor, width: 3)
                : Border.all(color: Colors.transparent, width: 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage("assets/images/emojis/$icn.png"),
              height: 40,
              width: 40,
            ),
            Text(
              txt,
              style: const TextStyle(
                color: mainGreenColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
