import 'package:allam_challenge/color_pallete.dart';
import 'package:allam_challenge/stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

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

  void plusNumber(){
    setState(() {
      textNumber ++;
      activeStep = 3;
      mainContainer = TextNumberStep();
    });
  }

 void minusNumber(){
    setState(() {
      textNumber --;
      activeStep = 3;
      mainContainer = TextNumberStep();
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    mainContainer = PoetryStep();
    poetryTest.clear();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body:
             Column(
               children: [
                SizedBox(height: 25,),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 20.0,
                      right: 35.0),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/poetry_2.png"),
                          width: 83, ),
                        SizedBox(width: 5,),
                        Text("تأليف الشعر",
                          style: TextStyle(
                            color: whiteColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            ),),
                      ],
                    ),
                  ),
                ),
    
                 SizedBox(
                  height: 100,
                   child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               EasyStepper(
                                      lineStyle: const LineStyle(
                                        lineType: LineType.normal,
                                        unreachedLineType: LineType.dashed,
                                      ),
                                      activeStep: activeStep,
                                      direction: Axis.horizontal,
                                      activeStepTextColor: Colors.white,
                                      unreachedStepTextColor:  Colors.white,
                                      finishedStepIconColor: Colors.white,
                                      finishedStepTextColor:  Colors.white,
                                      unreachedStepIconColor: Colors.white,
                                      unreachedStepBorderColor: Colors.transparent,
                                      finishedStepBackgroundColor: mainBegiColor,
                                      unreachedStepBackgroundColor: mainBegiColor,
                                      showTitle: true,
                                      onStepReached: (index) {
                                          setState(() => activeStep = index);
                                          },
                                      steps: const [
                                        EasyStep(
                                          icon: Icon(Icons.person),
                                          title: 'الشاعر',
                                          activeIcon: Icon(Icons.person),
                                        ),
                                        EasyStep(
                                          icon: Icon(Icons.celebration),
                                          activeIcon: Icon(Icons.celebration),
                                          title: 'المناسبة',
                                        ),
                                        EasyStep(
                                          icon: Icon(Icons.emoji_emotions_outlined),
                                          activeIcon: Icon(Icons.emoji_emotions_outlined),
                                          title: 'المشاعر',
                                        ),
                                         EasyStep(
                                          icon: Icon(Icons.line_style_outlined),
                                          activeIcon: Icon(Icons.line_style_outlined),
                                          title: 'الأبيات',
                                        ),
                                      ],
                                    ),
                             ],
                           ),
                   ),
                 ),
                 SizedBox(height: 20,),
                   
                //Stepper Pages
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    child: mainContainer
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: activeStep == 0 ? previuosBtn = false : previuosBtn = true,
                          child: Container(
                           height: 45,
                           width: 200,
                           margin: EdgeInsets.only(right: 20),
                           child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            backgroundColor: mainBegiColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                                           ),
                            onPressed: (){
                              setState(() {
                            //  if(activeStep == 0){
                            //   setState(() {
                            //     poetryTest.add("أكتب لي شعر ${"يتميز بالاسلوب الحديث والأساليب الغزلية والوطنية"} ");
                            //     mainContainer = EventStep();
                            //     activeStep = 1;
                            //   });
                           
                            //   }
                              if(activeStep == 1){
                                poetryTest.removeAt(0);
                                mainContainer = PoetryStep();
                                activeStep = 0;
                              }
                              else if(activeStep == 2){
                                poetryTest.removeAt(1);
                                mainContainer = EventStep();
                                activeStep = 1;
                              }
                              else if(activeStep == 3){
                                poetryTest.removeAt(2);
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                              }
                              });
                            
                            }, 
                            child: Text("السابق",
                            textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mainGreenColor,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      ),)),
                                           ),
                        ),
                      ),

                      SizedBox(width: 35,),

                      Expanded(
                        child: Container(
                         height: 45,
                         width: 320,
                         margin: EdgeInsets.only(left: 20),
                         child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: mainBegiColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                                         ),
                          onPressed: (){
                            setState(() {
                           if(activeStep == 0){
                            setState(() {
                              poetryTest.add("أكتب لي شعر ${"يتميز بالاسلوب الحديث والأساليب الغزلية والوطنية"} ");
                              mainContainer = EventStep();
                              activeStep = 1;
                            });
                         
                            }
                            else if(activeStep == 1){
                              poetryTest.add("بمناسبة ${_eventController.text} ");
                              mainContainer = EmotionsStep();
                              activeStep = 2;
                            }
                            else if(activeStep == 2){
                              poetryTest.add("فيه مشاعر ${_selectedEmoji} ");
                              mainContainer = TextNumberStep();
                              activeStep = 3;
                            }
                            else if(activeStep == 3){
                              poetryTest.add("ويتكون من أبيات عددها ${textNumber.toString()} .");
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => GeneratePoetry(
                                  generatedText: poetryText.toString(),
                                )));
                              // activeStep = 0;
                            }
                            });
                          
                          }, 
                          child: Text(activeStep == 3 ? "إنشاء" : "التالي",
                          textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: mainGreenColor,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    ),)),
                                         ),
                      ),
                    ],
                  ),
    
                 TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    setState(() {
                    activeStep = 0;
                    });
                  },
                   child: Text("إلغاء",
                      textAlign: TextAlign.center,
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                ),),
                 ),    
               ],
             ),
      ),
    );
  }

Widget PoetryStep(){
  return  Column(
    children: [
      Container(
       width: 324,
      //  height: 84,
        child: Text("لدينا عدد من الشعراء الإفتراضيين ، لكل واحد منهم أسلوبه الخاص في كتابة الشعر ، أختر الشاعر الذي يتناسب مع الشعر الذي تريد أن يتم تأليفه ",
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: whiteColor,
                 fontFamily: "Cairo",
                 fontWeight: FontWeight.w700,
                 fontSize: 15,
                 ),),
      ),
      Container(
        height: 250.0,
        child: CarouselView(
          backgroundColor: Colors.transparent,
          itemExtent: 350,
          shrinkExtent: 350,
           children: [0,1,2,3].map((i) {
             return Builder(
               builder: (BuildContext context) {
                 return Container(
                   height: 50,
                   width: MediaQuery.of(context).size.width,
                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                   child: Container(
                     margin: EdgeInsets.all(5),
                     child: Column(
                       children: [
                         Image(
                           image: AssetImage("assets/images/poyteriest_1.png"),
                           ),
                           SizedBox(height: 15,),
                           Container(
                             width: 324,
                             child: Text(poetryText[index],
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       color: whiteColor,
                                       fontFamily: "Cairo",
                                       fontWeight: FontWeight.w700,
                                       fontSize: 15,
                                       ),),
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

Widget EventStep(){
  return  Container(
                     child: Column(
                       children: [
                         Container(
                          width: 324,
                          height: 84,
                           child: Text("اكتب تفاصيل المناسبة التي تريد أن يتم تأليف الشعر لأجلها ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    ),),
                         ),
                         Container(
                          height: 284,
                          width: 319,
                           child: TextFormField(
                            controller: _eventController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(34.0),
                              borderSide: BorderSide.none
                            ),
                              filled: true,
                              fillColor: whiteColor,
                              hintText: "مثال: بمناسبة قدوم مولودتي الجديدة .."
                            ),
                            style: TextStyle(
                                    color: blackColor,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    ),
                           ),
                         ),
                       ],
                     ),
       );
}

bool isSelectedEmo1 = false;
bool isSelectedEmo2 = false;
bool isSelectedEmo3 = false;
bool isSelectedEmo4 = false;
bool isSelectedEmo5 = false;
bool isSelectedEmo6 = false;
bool isSelectedEmo7 = false;
bool isSelectedEmo8 = false;
bool isSelectedEmo9 = false;

Widget EmotionsStep(){
  return  Container(
                     child: Column(
                       children: [
                         Container(
                          width: 324,
                           child: Text("إختر مشاعرك تجاه المناسبة التي أخترتها",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    ),),
                         ),
                         SizedBox(height: 10,),
                         Container(
                          height: 330,
                          width: 319,
                           child: GridView.count(
                            crossAxisCount: 3,
                            children: [
                              iconsWidget("_smiling_face_with_heart_shaped_eyes"
                              ,"حب", isSelectedEmo1, (){
                                setState(() {
                                _selectedEmoji = "حب";
                                isSelectedEmo1 = true;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_confused",
                              "حيرة", isSelectedEmo2, (){
                                setState(() {
                                _selectedEmoji = "حيرة";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = true;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });}),
                              iconsWidget("_white_smiling",
                              "تفاؤل", isSelectedEmo3, (){
                                setState(() {
                                _selectedEmoji = "تفاؤل";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = true;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("face_with_open_mouth",
                              "إنبهار", isSelectedEmo4,(){
                                setState(() {
                                _selectedEmoji = "إنبهار";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = true;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_disappointed",
                              "إحباط", isSelectedEmo5, (){
                                setState(() {
                                _selectedEmoji = "إحباط";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = true;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_loudly_crying",
                              "حزن", isSelectedEmo6, (){
                                setState(() {
                                _selectedEmoji = "حزن";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = true;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_smiling_face_with_open_mouth",
                              "سعادة", isSelectedEmo7, (){
                                setState(() {
                                _selectedEmoji = "سعادة";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = true;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_neutral",
                              "تبلد",isSelectedEmo8, (){
                                setState(() {
                                _selectedEmoji = "تبلد";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = true;
                                isSelectedEmo9= false;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                              iconsWidget("_pouting",
                              "غضب", isSelectedEmo9 ,(){
                                setState(() {
                                _selectedEmoji = "غضب";
                                isSelectedEmo1 = false;
                                isSelectedEmo2 = false;
                                isSelectedEmo3 = false;
                                isSelectedEmo4 = false;
                                isSelectedEmo5 = false;
                                isSelectedEmo6 = false;
                                isSelectedEmo7 = false;
                                isSelectedEmo8 = false;
                                isSelectedEmo9= true;
                                mainContainer = EmotionsStep();
                                activeStep = 2;
                                });
                              }),
                          ],
                           ),
                         ),
                       ],
                     ),
       );
}

Widget TextNumberStep(){
  return  Container(
                     child: Column(
                       children: [
                         Container(
                          width: 324,
                          height: 50,
                           child: Text("حدد عدد الأبيات التي تريد تأليفها",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    ),),
                         ),
                         SizedBox(height: 50,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                              height: 96,
                              padding: EdgeInsets.only(left: 25, right: 25),
                              decoration: BoxDecoration(
                                    color: secondGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(22),
                                      bottomRight: Radius.circular(22),),
                                ),
                               child: Center(
                                 child: TextButton(
                                  onPressed: (){
                                    if(textNumber >= 10){

                                    }
                                    else plusNumber();
                                  },
                                   child: Text("+",
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
                             SizedBox(height: 10,),    
                             Container(
                              height: 96,
                              padding: EdgeInsets.only(left: 25, right: 25),
                              decoration: BoxDecoration(
                                    color: whiteColor,
                                ),
                               child: Center(
                                 child: Text(textNumber.toString(),
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
                             Container(
                              height: 96,
                              padding: EdgeInsets.only(left: 25, right: 25),
                              decoration: BoxDecoration(
                                    color: secondGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      bottomLeft: Radius.circular(22),),
                                ),
                               child: Center(
                                 child: TextButton(
                                  onPressed: (){
                                    if(textNumber <= 1){

                                    }
                                    else minusNumber();
                                  },
                                   child: Text("-",
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
                       ],
                     ),
       );
}

Widget iconsWidget(
  String icn,
  String txt,
  bool isSelectedEmo,
  Function() fun
){
  return  GestureDetector(
    onTap: fun,
    child: Container(
      height: 96,
      width: 96,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(22),
        border: isSelectedEmo == true ? 
        Border.all(color: secondGreenColor, width: 3) :
        Border.all()
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage("assets/images/emojis/$icn.png"),
          height: 40,
          width: 40,),
          Text(txt,
           style: TextStyle(
                            color: mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                                        ),)
        ],
      ),
    ),
  );
}

}