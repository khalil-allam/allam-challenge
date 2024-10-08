import 'package:allam_challenge/poetry_generation_pages/create_poetry.dart';
import 'package:allam_challenge/poetry_generation_pages/generate_poetry.dart';
import 'package:flutter/material.dart';

import '../coding_files/color_pallete.dart';


class AnalyisPoetry extends StatefulWidget {
  const AnalyisPoetry({super.key});

  @override
  State<AnalyisPoetry> createState() => _AnalyisPoetryState();
}

bool allBtn = true, summaryBtn = false, meaningBtn = false, detailsBtn = false, furtherMeaningBtn = false;
String catText = "";

class _AnalyisPoetryState extends State<AnalyisPoetry> {
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
                            image: AssetImage("assets/images/poetry_1.png"),
                            width: 83, ),
                          SizedBox(width: 5,),
                          Text("تحليل الشعر",
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
                           child: Text("قم بوضع الشعر الذي تريد تحليله وفهمه.",
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
                              hintText: "مثال : قفا نبكِ من ذكرى حبيبٍ ومنزلِ بسقطِ اللوى بين الدخولِ فحوملِ"
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
                      child: Text("معايير التحليل",
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
                            summaryBtn = false;
                            meaningBtn = false;
                            detailsBtn = false;
                            furtherMeaningBtn = false;
                            catText = "بشكل عام";
                          });
                        }),
                        tagsBtn("الخلاصة",
                        summaryBtn ? mainGreenColor : whiteColor, 
                        summaryBtn ? mainBegiColor : mainGreenColor, 
                        (){
                           setState(() {
                            allBtn = false; 
                            summaryBtn = true;
                            meaningBtn = false;
                            detailsBtn = false;
                            furtherMeaningBtn = false;
                            catText =  "بالخلاصة الشعرية";
                          });
                        }),
                        tagsBtn("المعنى العام",
                        meaningBtn ? mainGreenColor : whiteColor, 
                        meaningBtn ? mainBegiColor : mainGreenColor, 
                        (){
                           setState(() {
                            allBtn = false; 
                            summaryBtn = false;
                            meaningBtn = true;
                            detailsBtn = false;
                            furtherMeaningBtn = false;
                            catText = "بالمعنى العام";
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        tagsBtn("التفاصيل الدلالية",
                        detailsBtn ? mainGreenColor : whiteColor, 
                        detailsBtn ? mainBegiColor : mainGreenColor, 
                        (){
                           setState(() {
                            allBtn = false; 
                            summaryBtn = false;
                            meaningBtn = false;
                            detailsBtn = true;
                            furtherMeaningBtn = false;
                            catText = "بالتفاصيل الدلالية";
                          });
                        }),
                        tagsBtn("الأبعاد البلاغية",
                        furtherMeaningBtn ? mainGreenColor : whiteColor, 
                        furtherMeaningBtn ? mainBegiColor : mainGreenColor, 
                        (){
                           setState(() {
                            allBtn = false; 
                            summaryBtn = false;
                            meaningBtn = false;
                            detailsBtn = false;
                            furtherMeaningBtn = true;
                            catText = "بالأبعاد البلاغية";
                          });
                        }),
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
                  if(_textController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("لا يمكن ترك حقل الادخال فارغاً", 
                                        textAlign: TextAlign.right,
                                              style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              ),)));
                  }
                  else{
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context) => GeneratePoetry(
                  generatedText: "حلل لي النص الشعري ${_textController.text} بمعايير التحليل $catText",
                 )));
                  }
                }, 
                child: Text("تحليل",
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