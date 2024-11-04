// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:typed_data';
import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

// void main() {
//   WebViewPlatform.instance = WebWebViewPlatform();
//   runApp(const MaterialApp(home: WebViewExample()));
// }

class KhalilWebPage extends StatefulWidget {
  const KhalilWebPage();

  @override
  KhalilWebPageState createState() => KhalilWebPageState();
}

class KhalilWebPageState extends State<KhalilWebPage> {
  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse('https://app.khalil-app.io'),
      ),
    );

  final Uri _githubUrl = Uri.parse('https://github.com/khalil-allam');
  final Uri _documentUrl = Uri.parse(
      'https://drive.google.com/file/d/15MkfUDRlJjlffhWWzoTfvMwTJlI5_fge/view?usp=sharing');
  final Uri _googleSlidesUrl = Uri.parse(
      'https://docs.google.com/presentation/d/1ejzUKNPAyOrcWy1YUHxdfoqXFexGyVcLf3UG_-6T6-U/edit?usp=sharing');

  final Uri _macosUrl = Uri.parse(
      'https://docs.google.com/presentation/d/1ejzUKNPAyOrcWy1YUHxdfoqXFexGyVcLf3UG_-6T6-U/edit?usp=sharing');
  final Uri _windowsUrl = Uri.parse(
      'https://drive.google.com/file/d/1tIuDi15OpYVixwhJX54VqHHZI1ahn2kk/view?usp=drive_link');
  final Uri _androidUrl = Uri.parse(
      'https://drive.google.com/file/d/1NoF9xBKrmceTicu-ohGSVLBHWWwSJ1Ay/view?usp=drive_link');

  @override
  Widget build(BuildContext context) {
    double screenWiedth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: whiteColor),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KHALIL',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "ReemKufi",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                'A SOLUTION FOR ALLAM CHALLENGE 2024',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "ReemKufi",
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  launchUrl(_documentUrl);
                },
                tooltip: "Khalil Document",
                icon: Icon(FontAwesomeIcons.fileArrowDown)),
            IconButton(
                onPressed: () {
                  launchUrl(_googleSlidesUrl);
                },
                tooltip: "Khalil Slides",
                icon: Icon(FontAwesomeIcons.googleDrive)),
            IconButton(
                onPressed: () {
                  launchUrl(_githubUrl);
                },
                tooltip: "Github Repo",
                icon: Icon(FontAwesomeIcons.github)),
            // _SampleMenu(_controller),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 770,
                child: Stack(
                  children: [
                    screenWiedth >= 950
                        ? Positioned(
                            bottom: 1,
                            right: 1,
                            left: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 500,
                                  width: 900,
                                  margin: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                      color: secondGreenColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(2500),
                                          topLeft: Radius.circular(2500))),
                                ).animate().fade().scale(
                                    duration: Duration(milliseconds: 500)),
                              ],
                            ),
                          )
                        : Positioned(
                            left: 1,
                            child: Container(
                              height: 400,
                              width: 400,
                              margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: secondGreenColor,
                                  borderRadius: BorderRadius.circular(800)),
                            ),
                          )
                            .animate()
                            .fade()
                            .scale(duration: Duration(milliseconds: 500)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 700,
                          child: Stack(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 312,
                                    height: 675,
                                    padding: EdgeInsets.all(5),
                                    color: mainGreenColor,
                                    child: PlatformWebViewWidget(
                                      PlatformWebViewWidgetCreationParams(
                                          controller: _controller),
                                    ).build(context),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 400,
                                  height: 700,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/phone.png"),
                                          fit: BoxFit.contain)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                os_download_buttons("Khalil for Android", "Get Khalil for android", _androidUrl, FontAwesomeIcons.android),
                os_download_buttons("Khalil for Windows", "Get Khalil for windows", _windowsUrl, FontAwesomeIcons.windows),
                os_download_buttons("Khalil for macOS", "Get Khalil for mac", _macosUrl, FontAwesomeIcons.apple)
              ],),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Sponsered By: ",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: "ReemKufi",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sponsors_logo('allam_logo'),
                  sponsors_logo('sadaia_logo'),
                  sponsors_logo('sfcpd_logo'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
Widget os_download_buttons(
  String osText,
  String tooltip,
  Uri url,
  IconData Icon_data
){
  return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              backgroundColor: secondGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                  onPressed: (){
                   launchUrl(url);
                  },
                  child: Column(
                    children: [
                      Text(osText,
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: "ReemKufi",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),),
                      IconButton(
                      onPressed: () {
                      },
                      tooltip: tooltip,
                      icon: Icon(Icon_data)),
                    ],
                  ),
                );
}

Widget sponsors_logo(String imageAsset) {
    return Expanded(
      child: Center(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$imageAsset.png"),
                  fit: BoxFit.scaleDown)),
        ),
      ),
    );
  }
}

// enum _MenuOptions {
//   doPostRequest,
// }

// class _SampleMenu extends StatelessWidget {
//   const _SampleMenu(this.controller);

//   final PlatformWebViewController controller;

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<_MenuOptions>(
//       onSelected: (_MenuOptions value) {
//         switch (value) {
//           case _MenuOptions.doPostRequest:
//             _onDoPostRequest(controller);
//         }
//       },
//       itemBuilder: (BuildContext context) => <PopupMenuItem<_MenuOptions>>[
//         const PopupMenuItem<_MenuOptions>(
//           value: _MenuOptions.doPostRequest,
//           child: Text('Post Request'),
//         ),
//       ],
//     );
//   }

//   Future<void> _onDoPostRequest(PlatformWebViewController controller) async {
//     final LoadRequestParams params = LoadRequestParams(
//       uri: Uri.parse('https://httpbin.org/post'),
//       method: LoadRequestMethod.post,
//       headers: const <String, String>{
//         'foo': 'bar',
//         'Content-Type': 'text/plain'
//       },
//       body: Uint8List.fromList('Test Body'.codeUnits),
//     );
//     await controller.loadRequest(params);
//   }
// }
