import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class MyStepperWidget extends StatefulWidget {
  const MyStepperWidget({
    super.key,
    this.currentStep = 1,
    this.circleWidth = 53,
    required this.numOfSteps,
    required this.texts,
    required this.selectedColor,
    required this.unSelectedColor,
    this.horizontalPadding = 0,
    this.virticalPadding = 10,
    this.itemsAlignment = MainAxisAlignment.spaceBetween,
    this.isDashedLine = true,
    this.lineThickness = 1,
    required this.icons,
    required this.lineColor,
  }) : assert(numOfSteps == texts.length);
  final int currentStep;
  final int numOfSteps;
  final double circleWidth;
  final List<String> texts;
  final List<IconData> icons;
  final Color unSelectedColor;
  final Color selectedColor;
  final double horizontalPadding;
  final double virticalPadding;
  final MainAxisAlignment itemsAlignment;
  final bool isDashedLine;
  final double lineThickness;
  final Color lineColor;

  @override
  State<MyStepperWidget> createState() => _MyStepperWidgetState();
}

class _MyStepperWidgetState extends State<MyStepperWidget> {
  int numOfDots = 0;
  bool firstTime = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      double dottedWidth = (MediaQuery.of(context).size.width -
              (widget.circleWidth * widget.numOfSteps)) /
          (widget.numOfSteps - 1);
      for (int i = 0; true; i++) {
        if (5 * i >= dottedWidth - 5) {
          numOfDots = i;
          debugPrint(dottedWidth.toString());
          debugPrint(numOfDots.toString());
          break;
        }
      }
      firstTime = false;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.virticalPadding,
            horizontal: widget.horizontalPadding),
        child: Stack(
          children: [
            Positioned(
              top: (widget.circleWidth / 2) - (widget.lineThickness / 2),
              left: 0,
              child: widget.isDashedLine
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.filled(
                        300,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: widget.lineColor,
                            ),
                            height: widget.lineThickness,
                            width: 4,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: widget.lineColor,
                      ),
                      clipBehavior: Clip.antiAlias,
                      height: widget.lineThickness,
                      width: MediaQuery.sizeOf(context).width,
                    ),
            ),
            Row(
              mainAxisAlignment: widget.itemsAlignment,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                widget.numOfSteps,
                (index) => stepItem(
                  text: widget.texts[index],
                  index: index,
                  stepsNum: widget.numOfSteps,
                  currentStep: widget.currentStep,
                  circleWidth: widget.circleWidth,
                  icon: widget.icons[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepItem(
      {required String text,
      required int index,
      required int stepsNum,
      required int currentStep,
      required double circleWidth,
      required IconData icon}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: circleWidth,
          height: circleWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(100),
            color: index + 1 == currentStep
                ? widget.selectedColor
                : widget.unSelectedColor,
            // color: index + 1 <= currentStep ? widget.mainColor : Colors.white,
          ),
          child: Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: Icon(
                icon,
              )
              // SvgPicture.asset(
              //   icon,
              //   // colorFilter: ColorFilter.mode(
              //   //     index + 1 == currentStep ? Colors.white : Colors.grey,
              //   //     BlendMode.srcIn,
              //   //     ),
              // ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: circleWidth,
          child: Text(
            text,
            style: TextStyle(
              color: widget.unSelectedColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

// default use 
// MyStepperWidget(
//             horizontalPadding: 20,
//             currentStep: 2,
//             numOfSteps: 4,
//             lineColor: Colors.blue.withOpacity(0.8),
//             texts: const ['الشاعر', 'المناسبة', 'المشاعر', 'الأبيات'],
//             selectedColor: Colors.green,
//             unSelectedColor: Colors.amber,
//             icons: const [
//               'assets/images/award.svg',
//               'assets/images/award.svg',
//               'assets/images/award.svg',
//               'assets/images/award.svg',
//             ],
//             itemsAlignment: MainAxisAlignment.spaceBetween,
//             isDashedLine: false,
//             lineThickness: 6,
//           ),
