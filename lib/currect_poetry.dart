import 'package:allam_challenge/create_poetry.dart';
import 'package:allam_challenge/generate_poetry.dart';
import 'package:flutter/material.dart';

import 'color_pallete.dart';


class CurrectPoetry extends StatefulWidget {
  const CurrectPoetry({super.key});

  @override
  State<CurrectPoetry> createState() => _CurrectPoetryState();
}
bool allBtn = true, linguisticallyBtn = false, grammaticallyBtn = false, rhymeBtn = false;
String catText = "";

class _CurrectPoetryState extends State<CurrectPoetry> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body: SingleChildScrollView(
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
                            image: AssetImage("assets/images/revision.png"),
                            width: 83, ),
                          SizedBox(width: 5,),
                          Text("تصحيح الشعر",
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              ),),
                        ],
                      ),
                    ),

                    Container(
                     child: Column(
                       children: [
                         Container(
                          width: 324,
                          height: 50,
                           child: Text("قم بوضع الشعر الذي تريد تصحيح وإعادة كتابته.",
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
                            controller: _textController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(34.0),
                              borderSide: BorderSide.none
                            ),
                              filled: true,
                              fillColor: whiteColor,
                              hintText: "مثال : أحببتُ السماء لأنها عاليةٌ وفيها النجوم تبدو ساطعةٌ والقمر يجلس وحيدًا فيها ويفكر في الأرض وهو متعبٌ"
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
       ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Text("تصحيح الأبيات",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          ),),
                    ),
                  ],
                ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        tagsBtn("الكل",
                        allBtn ? mainGreenColor : whiteColor, 
                        allBtn ? mainBegiColor : mainGreenColor,
                        (){
                           setState(() {
                            allBtn = true; 
                            linguisticallyBtn = false;
                            grammaticallyBtn = false;
                            rhymeBtn = false;
                            catText = "الشعر كاملاُ";
                          });
                        }),
                        tagsBtn("لغوياً",
                        linguisticallyBtn ? mainGreenColor : whiteColor, 
                        linguisticallyBtn ? mainBegiColor : mainGreenColor,
                        (){
                            setState(() {
                            allBtn = false; 
                            linguisticallyBtn = true;
                            grammaticallyBtn = false;
                            rhymeBtn = false;
                            catText = "لغوياً";
                          });
                        }),
                        tagsBtn("نحوياً",
                        grammaticallyBtn ? mainGreenColor : whiteColor, 
                        grammaticallyBtn ? mainBegiColor : mainGreenColor,
                        (){
                            setState(() {
                            allBtn = false; 
                            linguisticallyBtn = false;
                            grammaticallyBtn = true;
                            rhymeBtn = false;
                            catText = "نحوياً";
                          });
                        }),
                        tagsBtn("قـافية",
                        rhymeBtn ? mainGreenColor : whiteColor, 
                        rhymeBtn ? mainBegiColor : mainGreenColor,
                        (){
                            setState(() {
                            allBtn = false; 
                            linguisticallyBtn = false;
                            grammaticallyBtn = false;
                            rhymeBtn = true;
                            catText = "قـافية";
                          });
                        }),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
              SizedBox(height: 15,),
              Container(
              height: 58,
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainBegiColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: (){
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context) => GeneratePoetry(
                  generatedText: "صحح لي النص الشعري ${_textController.text} بمعايير التصحيح $catText",
                 )));
                }, 
                child: Text("تصحيح",
                style: TextStyle(
                color: mainGreenColor,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
                fontSize: 26,
                        ),),
                ),
            ),
              TextButton(
                    onPressed: (){
                      Navigator.pop(context);
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
                    SizedBox(height: 10,),    
                  ]
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
){
  return   Container(
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
                      child: Text(title,
                      textAlign: TextAlign.center,
                              style: TextStyle(
                                color: clr,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                ),),
                            ),);
}
}