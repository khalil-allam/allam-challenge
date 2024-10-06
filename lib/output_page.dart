import 'package:allam_challenge/color_pallete.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';



class OutputPage extends StatefulWidget {
  final String output_text;
  const OutputPage({super.key, required this.output_text});

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        appBar: AppBar(
          backgroundColor: mainGreenColor,
          iconTheme: IconThemeData(color: whiteColor),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            SizedBox(
                              height: 25,),
                            //  Container(
                            //   width: 324,
                            //   height: 84,
                            //    child: Text("الشعر المخرج من علّام",
                            //           style: TextStyle(
                            //             color: whiteColor,
                            //             fontFamily: "Cairo",
                            //             fontWeight: FontWeight.w700,
                            //             fontSize: 18,
                            //             ),),
                            //  ),
                             Expanded(
                              flex: 9,
                               child: Container(
                                width: 319,
                                margin: EdgeInsets.only(bottom: 15),
                                 child: ListView(
                                   children: [
                                     Text(
                                     widget.output_text,
                                     softWrap: true,
                                     textAlign: TextAlign.justify,
                                     style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              ),),
                                   ],
                                 )
                               ),
                             ),
                           ],
                         ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: mainGreenColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  FlutterClipboard
                  .copy(widget.output_text)
                  .then(( value ) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم النسخ بنجاح", style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              ),))));
                }, icon: Icon(Icons.refresh_outlined, color: mainBegiColor,)),
               IconButton(
                onPressed: (){
                  FlutterClipboard
                  .copy(widget.output_text)
                  .then(( value ) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم النسخ بنجاح", style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              ),))));
                }, icon: Icon(Icons.copy_outlined, color: mainBegiColor,)),
               IconButton(
                onPressed: (){
                  Share.share(widget.output_text, 
                  subject: "مخرجات تطبيق علّام");
                }, icon: Icon(Icons.share_outlined, color: mainBegiColor,))
            ],
          ),
        ),
      ),
    );
  }
}