// Copyright 2020 J-P Nurmi <jpnurmi@gmail.com>
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

import 'color_pallete.dart';

class StepperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'CupertinoStepper for Flutter',
      debugShowCheckedModeBanner: false,
      home: StepperPage(),
    );
  }
}

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('CupertinoStepper for Flutter'),
        ),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              switch (orientation) {
                case Orientation.portrait:
                  return _buildStepper(StepperType.vertical);
                case Orientation.landscape:
                  return _buildStepper(StepperType.horizontal);
                default:
                  throw UnimplementedError(orientation.toString());
              }
            },
          ),
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < 3; ++i)
          _buildStep(
            title: Text('Step ${i + 1}'),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep ? StepState.complete : StepState.indexed,
          ),
        _buildStep(
          title: Text('Error'),
          state: StepState.error,
        ),
        _buildStep(
          title: Text('Disabled'),
          state: StepState.disabled,
        )
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(
          child: Column(
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
                             child: Text("poetryText[index]",
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
  ),
        ),
      ),
    );
  }
}