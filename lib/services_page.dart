import 'package:allam_challenge/color_pallete.dart';
import 'package:flutter/material.dart';


class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/khalil_logo.png",),
                    height: 129,
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        right: 15,
                        bottom: 10),
                      child: Text("خدمات التطبيق",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        ),),
                    ),
                      //buttons
                    servicesBtn(
                      "تأليف الشعر", 
                      "كتابة الشعر العربي بإستخدام الذكاء الإصطناعي.", 
                      "poetry_2", 
                      ServicesPage()),
                    servicesBtn(
                      "تحليل الشعر", 
                      "ضع الشعر لتحليله وتقييمه من قبل الذكاء الإصطناعي", 
                      "poetry_1", 
                      ServicesPage()),
                    servicesBtn(
                      "تصحيح الشعر", 
                      "ضع الشعر ليتم تصحيح الشعر من الجوانب اللغوية والبلاغية", 
                      "revision", 
                      ServicesPage())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget servicesBtn(
  String title, 
  subtitle, 
  img,
  Widget pageName
){
  return          Stack(
                    children: [
                      Expanded(
                        child: Container(
                        // height: 126,
                        width: 331,
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            backgroundColor: secondBegiColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                                        onPressed: (){
                                         Navigator.push(context, 
                                         MaterialPageRoute(builder: (context)=> pageName));
                                        }, 
                      child: Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 83,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                        style: TextStyle(
                                          color: mainGreenColor,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                                  ),),
                                  
                                  Text(subtitle,
                                        style: TextStyle(
                                          color: mainGreenColor,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                                  ),),
                                ],
                              ),
                            ),
                          ],),
                      ),
                              ),
                          ),
                      ),

                         Positioned(
                          right: 15,
                           child: Image(image: AssetImage("assets/images/$img.png"),
                                                   height: 75,
                                                   width: 83,),
                         ),
                    ],
                  );
}
}