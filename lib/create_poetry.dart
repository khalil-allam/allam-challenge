import 'package:allam_challenge/color_pallete.dart';
import 'package:allam_challenge/stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'generate_poetry.dart';

int activeStep = 0;
Widget mainContainer = Container();

class CreatePoetry extends StatefulWidget {
  const CreatePoetry({super.key});

  @override
  State<CreatePoetry> createState() => _CreatePoetryState();
}

class _CreatePoetryState extends State<CreatePoetry> {

  TextEditingController _eventController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    mainContainer = PoetryStep();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body:
             SingleChildScrollView(
               child: Column(
                 children: [
                  Padding(
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
                   SizedBox(
                    height: 120,
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
                                            setState(() {
                                              if(activeStep == 0){
                                                mainContainer = PoetryStep();
                                              }
                                              else if(activeStep == 1){
                                                mainContainer = EventStep();
                                              }
                                              else if(activeStep == 2){
                                                mainContainer = EmotionsStep();
                                              }
                                              else if(activeStep == 3){
                                                mainContainer = PoetryStep();
                                              }
                                            });
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
                   SizedBox(height: 7,),

                  //Stepper Pages
                  mainContainer,

                   Container(
                     height: 58,
                     width: 256,
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
                        
                          mainContainer = EventStep();
                          activeStep = 1;
                     
                        }
                        else if(activeStep == 1){
                        
                          mainContainer = EmotionsStep();
                          activeStep = 2;
                   
                        }
                        else if(activeStep == 2){
                          
                          mainContainer = EmotionsStep();
                          activeStep = 3;
                        }
                        else if(activeStep == 3){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => GeneratePoetry()));
                          activeStep = 0;
                        }
                        });
                      
                      }, 
                      child: Text("التالي",
                      textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainGreenColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 26,
                                ),)),
                   ),
                   SizedBox(height: 7,),
                   Text("عودة",
                      textAlign: TextAlign.center,
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                ),),  
                    SizedBox(height: 10,),          
                 ],
               ),
             ),
    
      ),
    );
  }

Widget PoetryStep(){
  return  Container(
                     child: Column(
                       children: [
                         Container(
                          width: 324,
                          height: 84,
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
                          height: 151,
                           child: FlutterCarousel(
                              options: FlutterCarouselOptions(
                                height: 400.0,
                                floatingIndicator: false,
                                showIndicator: false,
                                // showIndicator: true,
                                // slideIndicator: SequentialFillIndicator(),
                              ),
                              items: [1,2,3,].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 151,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Image(
                                              image: AssetImage("assets/images/poyteriest_1.png"),
                                              ),
                                          ),
                                          Visibility(
                                            visible: i == 1 ? false : true,
                                            child: Positioned(
                                              top: 70.5,
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                color: mainBegiColor,
                                                child: GestureDetector(
                                                  onTap: (){},
                                                  child: Center(
                                                    child: Icon(Icons.arrow_back_ios_new, 
                                                    color: blackColor,
                                                    ),
                                                  ),)
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: i == 3 ? false : true,
                                            child: Positioned(
                                              left: 13,
                                              top: 70.5,
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                color: mainBegiColor,
                                                child: GestureDetector(
                                                  onTap: (){},
                                                  child: Center(
                                                    child: Icon(Icons.arrow_forward_ios_outlined, 
                                                    color: blackColor,
                                                    ),
                                                  ),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      // Text('text $i', style: TextStyle(fontSize: 16.0)
                                      // ,)
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                         ),
                         SizedBox(height: 15,),
                         Container(
                          width: 324,
                          height: 84,
                           child: Text("مهتم نوّاس بالأدب العربي ويستخدم في كتابة الأشعار أسلوب الشعر الحديث ويتميز بأشعاره الغزلية والوطنية .",
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
                              ,"حب",(){}),
                              iconsWidget("_confused",
                              "حيرة",(){}),
                              iconsWidget("_white_smiling",
                              "تفاؤل",(){}),
                              iconsWidget("face_with_open_mouth",
                              "إنبهار",(){}),
                              iconsWidget("_disappointed",
                              "إحباط",(){}),
                              iconsWidget("_loudly_crying",
                              "حزن",(){}),
                              iconsWidget("_smiling_face_with_open_mouth",
                              "سعادة",(){}),
                              iconsWidget("_neutral",
                              "تبلد",(){}),
                              iconsWidget("_pouting",
                              "غضب",(){}),
                          ],
                           ),
                         ),
                       ],
                     ),
       );
}

Widget iconsWidget(
  String icn,
  String txt,
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
        border: Border.all(color: secondGreenColor, width: 3)
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