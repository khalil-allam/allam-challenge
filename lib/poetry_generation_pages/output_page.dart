import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: whiteColor),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
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
                          ),
                        ),
                      ],
                    )),
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
                onPressed: () {
                  Share.share(widget.output_text,
                      subject: "مخرجات تطبيق علّام");
                },
                icon: Container(
                  decoration: BoxDecoration(
                    color: mainBegiColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/images/share.svg',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FlutterClipboard.copy(widget.output_text).then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "تم النسخ بنجاح",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ));
                },
                icon: Container(
                  decoration: BoxDecoration(
                    color: mainBegiColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/images/copy.svg',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FlutterClipboard.copy(widget.output_text).then(
                    (value) => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                            content: Text(
                      "تم النسخ بنجاح",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ))),
                  );
                },
                icon: Container(
                  decoration: BoxDecoration(
                    color: mainBegiColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/images/download.svg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
