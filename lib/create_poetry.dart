import 'package:allam_challenge/color_pallete.dart';
import 'package:allam_challenge/stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

int activeStep = 0;
class CreatePoetry extends StatefulWidget {
  const CreatePoetry({super.key});

  @override
  State<CreatePoetry> createState() => _CreatePoetryState();
}

class _CreatePoetryState extends State<CreatePoetry> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body:
             Column(
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
                                      onStepReached: (index) =>
                                          setState(() => activeStep = index),
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
                                  Image(
                                    image: AssetImage("assets/images/poyteriest_1.png"),
                                    ),
                                  Positioned(
                                    top: 70.5,
                                    child: Container(
                                      height: 23,
                                      width: 23,
                                      color: mainBegiColor,
                                      child: GestureDetector(
                                        onTap: (){},
                                        child: Center(
                                          child: Icon(Icons.arrow_back_ios_new, 
                                          color: blackColor,),
                                        ),)
                                    ),
                                  )
                                ],
                              )
                              // Text('text $i', style: TextStyle(fontSize: 16.0)
                              // ,)
                            );
                          },
                        );
                      }).toList(),
                    ),
                 )
               ],
             ),
        // MyStepperWidget(
        //       horizontalPadding: 20,
        //       currentStep: 2,
        //       numOfSteps: 4,
        //       lineColor: Colors.blue.withOpacity(0.8),
        //       texts: const ['الشاعر', 'المناسبة', 'المشاعر', 'الأبيات'],
        //       selectedColor: Colors.green,
        //       unSelectedColor: Colors.amber,
        //       icons: const [
        //         Icons.add,
        //         Icons.add,
        //         Icons.add,
        //         Icons.add,
        //       ],
        //       itemsAlignment: MainAxisAlignment.spaceBetween,
        //       isDashedLine: false,
        //       lineThickness: 6,
        //     ),
      ),
    );
  }
}