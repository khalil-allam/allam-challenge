import 'dart:io';

import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../coding_files/shared.dart';
import '../theme_provider.dart';

class OutputPage extends StatefulWidget {
  final String outputText;
  const OutputPage({super.key, required this.outputText});

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: mainGreenColor,
        appBar: AppBar(
          // backgroundColor: mainGreenColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(
            color: context.watch<ThemeProvider>().isDarkMode
                ? whiteColor
                : mainGreenColor,
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 9,
                child: Container(
                    width: 319,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListView(
                      children: [
                        Text(
                          widget.outputText,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: context.watch<ThemeProvider>().isDarkMode
                                ? whiteColor
                                : mainGreenColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w600,
                            fontSize: 18 + extraFontSize,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: context.watch<ThemeProvider>().isDarkMode
              ? mainGreenColor
              : whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Share.share(widget.outputText, subject: "مخرجات تطبيق علّام");
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
                  FlutterClipboard.copy(widget.outputText).then(
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
                    ),
                  );
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
                onPressed: () async {
                  final myTheme = pw.ThemeData.withFont(
                    base: pw.Font.ttf(
                      await rootBundle.load(
                        "fonts/Cairo-Regular.ttf",
                      ),
                    ),
                    bold: pw.Font.ttf(
                      await rootBundle.load(
                        "fonts/Cairo-Bold.ttf",
                      ),
                    ),
                  );
                  final pdf = pw.Document(
                    theme: myTheme,
                  );

                  pdf.addPage(
                    pw.MultiPage(
                      pageFormat: PdfPageFormat.a4,
                      textDirection: pw.TextDirection.rtl,
                      build: (pw.Context context) {
                        return [
                          pw.Paragraph(
                            text: widget.outputText,
                          ),
                        ];
                      },
                    ),
                  ); // Page
                  var dir = await getApplicationDocumentsDirectory();
                  final file = File(
                      "${dir.path}/khalil_result_${DateTime.now().millisecondsSinceEpoch}.pdf");
                  await file.writeAsBytes(await pdf.save());
                  await OpenFile.open(file.path);
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
