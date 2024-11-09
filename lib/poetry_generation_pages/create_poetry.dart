import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/model/poet_model.dart';
import 'package:allam_challenge/prompts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../coding_files/shared.dart';
import '../coding_files/stepper.dart';
import '../theme_provider.dart';
import 'generate_poetry.dart';

int activeStep = 0;
Widget mainContainer = Container();
int textNumber = 1;
int index = 0;
String _selectedEmoji = "";

List<String> poetryText = [
  "باسلوب الشعر الحديث",
  "باسلوب الشعر الشعبي",
  "باسلوب الشعر العمودي",
  "باسلوب الشعر الحر",
  "باسلوب الشعر الفلسفي",
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
  Color textColor = whiteColor;

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
    activeStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textColor = Provider.of<ThemeProvider>(
      context,
    ).isDarkMode
        ? whiteColor
        : mainGreenColor;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.watch<ThemeProvider>().isDarkMode
            ? mainGreenColor
            : secondBegiColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/poetry_2.png"),
                        width: 83,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "تأليف الشعر",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700,
                          fontSize: 24 + extraFontSize,
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
                  lineColor: context.watch<ThemeProvider>().isDarkMode
                      ? secondBegiColor
                      : mainGreenColor,
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
                  circleWidth: 52,
                  textColor: textColor,
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
                                if (activeStep == 1) {
                                  mainContainer = poetryStep();
                                  activeStep = 0;
                                } else if (activeStep == 2) {
                                  mainContainer = eventStep();
                                  activeStep = 1;
                                } else if (activeStep == 3) {
                                  mainContainer = emotionsStep();
                                  activeStep = 2;
                                }
                              });
                            },
                            child: Text(
                              "السابق",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainGreenColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 20 + extraFontSize,
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
                                      mainContainer = eventStep();
                                      activeStep = 1;
                                    });
                                  } else if (activeStep == 1) {
                                    mainContainer = emotionsStep();
                                    activeStep = 2;
                                  } else if (activeStep == 2) {
                                    mainContainer = textNumberStep();
                                    activeStep = 3;
                                  } else if (activeStep == 3) {
                                    if (_eventController.text.isEmpty ||
                                        _eventController.text.isEmpty ||
                                        _selectedEmoji == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "الرجاء تعبئة جميع الحقول السابقة",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15 + extraFontSize,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GeneratePoetry(
                                            generatedText: Prompts.createPoem(
                                              poet: poetryText[selectedPoet],
                                              occasion: _eventController.text,
                                              feelings: _selectedEmoji,
                                              length: textNumber,
                                            ),
                                            poetry_service_type: "انشاء",
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
                              style: TextStyle(
                                color: mainGreenColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 20 + extraFontSize,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PoetModel> poets = [
    PoetModel(
        name: 'نوّاس',
        description:
            'شاعر متجدد يتميز بأسلوبه الفريد في الشعر الحديث، يعشق استخدام اللغة الجريئة والتشبيهات العصرية.',
        width: 180),
    PoetModel(
        name: 'حاتم',
        description:
            'شاعر شعبي يُعرف بحكاياته الممتعة وقصائده القريبة من قلب الناس ، ينسج أشعاره بأسلوب سهل وبسيط يجعلها تصل إلى جميع فئات المجتمع. ',
        width: 150),
    PoetModel(
        name: 'ليلى',
        description:
            'شاعرة متمكنة في الشعر العمودي، حيث تمتلك قدرة فريدة على استخدام الوزن والقافية بمهارة. تعتبر أشعارها بمثابة لوحات فنية تنقل القيم والمشاعر',
        width: 150),
    PoetModel(
        name: 'شدّاد',
        description:
            'شاعر حر يتقن فنون التعبير عن الأفكار العميقة والمشاعر المعقدة بأسلوب مميز، لا يلتزم بأي قيود شعرية عندما يكتب أشعاره',
        width: 150),
    PoetModel(
        name: 'قيس',
        description:
            'شاعر فلسفي يتأمل في معاني الحياة والوجود من خلال قصائده العميقة ، يتميز بلغة شاعرية متألقة وبأسلوب فلسفي',
        width: 150),
  ];
  var pageController =
      PageController(keepPage: true, initialPage: 0, viewportFraction: 0.9);
  int selectedPoet = 0;
  Widget poetryStep() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "لدينا عدد من الشعراء الإفتراضيين ، لكل واحد منهم أسلوبه الخاص في كتابة الشعر ، أختر الشاعر الذي يتناسب مع الشعر الذي تريد أن يتم تأليفه ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
                fontSize: 15 + extraFontSize,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 350,
            child: PageView(
              controller: pageController,

              onPageChanged: (index) {
                selectedPoet = index;
              },

              children: List.generate(
                poets.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: poets[index].width.toDouble(),
                                    ),
                                    Expanded(
                                      child: Text(
                                        poets[index].name,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned.directional(
                                bottom: 0,
                                textDirection: TextDirection.rtl,
                                // start: 20,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/poet${index + 1}.png',
                                    width: poets[index].width.toDouble(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            poets[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w700,
                              fontSize: 15 + extraFontSize,
                            ),
                          ),
                        ],
                      ),
                   ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eventStep() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "اكتب تفاصيل المناسبة التي تريد أن يتم تأليف الشعر لأجلها ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 15 + extraFontSize,
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
            style: TextStyle(
              color: blackColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 15 + extraFontSize,
            ),
          ),
        ],
      ),
    );
  }

  int? selectedEmoji;

  Widget emotionsStep() {
    return Column(
      children: [
        Text(
          "إختر مشاعرك تجاه المناسبة التي أخترتها",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w700,
            fontSize: 15 + extraFontSize,
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
                });
              }),
              iconsWidget("_confused", "حيرة", selectedEmoji == 1, () {
                setState(() {
                  _selectedEmoji = "حيرة";
                  selectedEmoji = 1;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("_white_smiling", "تفاؤل", selectedEmoji == 2, () {
                setState(() {
                  _selectedEmoji = "تفاؤل";
                  selectedEmoji = 2;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("face_with_open_mouth", "إنبهار", selectedEmoji == 3,
                  () {
                setState(() {
                  _selectedEmoji = "إنبهار";
                  selectedEmoji = 3;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("_disappointed", "إحباط", selectedEmoji == 4, () {
                setState(() {
                  _selectedEmoji = "إحباط";
                  selectedEmoji = 4;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("_loudly_crying", "حزن", selectedEmoji == 5, () {
                setState(() {
                  _selectedEmoji = "حزن";
                  selectedEmoji = 5;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget(
                  "_smiling_face_with_open_mouth", "سعادة", selectedEmoji == 6,
                  () {
                setState(() {
                  _selectedEmoji = "سعادة";
                  selectedEmoji = 6;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("_neutral", "تبلد", selectedEmoji == 7, () {
                setState(() {
                  _selectedEmoji = "تبلد";
                  selectedEmoji = 7;
                  mainContainer = emotionsStep();
                });
              }),
              iconsWidget("_pouting", "غضب", selectedEmoji == 8, () {
                setState(() {
                  _selectedEmoji = "غضب";
                  selectedEmoji = 8;
                  mainContainer = emotionsStep();
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
        Text(
          "حدد عدد الأبيات التي تريد تأليفها",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w700,
            fontSize: 15 + extraFontSize,
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
                child: Center(
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 42 + extraFontSize,
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
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                    fontSize: 42 + extraFontSize,
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
                child: Center(
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                      fontSize: 42 + extraFontSize,
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
              style: TextStyle(
                color: mainGreenColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
                fontSize: 14 + extraFontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
