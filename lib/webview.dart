// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:typed_data';
// import 'package:allam_challenge/coding_files/color_pallete.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';

// void main() {
//   WebViewPlatform.instance = WebWebViewPlatform();
//   runApp(const MaterialApp(home: WebViewExample()));
// }

// class WebViewExample extends StatefulWidget {
//   const WebViewExample();

//   @override
//   WebViewExampleState createState() => WebViewExampleState();
// }

// class WebViewExampleState extends State<WebViewExample> {
//   final PlatformWebViewController _controller = PlatformWebViewController(
//     const PlatformWebViewControllerCreationParams(),
//   )..loadRequest(
//       LoadRequestParams(
//         uri: Uri.parse('https://app.khalil-app.io'),
//       ),
//     );

//   @override
//   Widget build(BuildContext context) {
//     double screenWiedth = MediaQuery.sizeOf(context).width;
//     double screenHeight = MediaQuery.sizeOf(context).height;

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: mainGreenColor,
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: whiteColor),
//           title: Text(
//             'خليل',
//             style: TextStyle(
//               color: whiteColor,
//               fontFamily: "ReemKufi",
//               fontWeight: FontWeight.w500,
//               fontSize: 24,
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           actions: <Widget>[
//             IconButton(
//                 onPressed: () {},
//                 tooltip: "Khalil Document",
//                 icon: Icon(FontAwesomeIcons.download)),
//             IconButton(
//                 onPressed: () {},
//                 tooltip: "Github Repo",
//                 icon: Icon(FontAwesomeIcons.github)),
//             // _SampleMenu(_controller),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: 900,
//             child: Stack(
//               children: [
//                 screenWiedth >= 950
//                     ? Positioned(
//                         bottom: 1,
//                         right: 1,
//                         left: 1,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 500,
//                               width: 900,
//                               margin: EdgeInsets.only(right: 5, left: 5),
//                               decoration: BoxDecoration(
//                                   color: secondGreenColor,
//                                   // borderRadius: BorderRadius.circular(800)
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(2500),
//                                       topLeft: Radius.circular(2500))),
//                             ).animate().fade().scale(),
//                           ],
//                         ),
//                       )
//                     : Positioned(
//                         left: 1,
//                         child: Container(
//                           height: 400,
//                           width: 400,
//                           margin: EdgeInsets.all(7),
//                           decoration: BoxDecoration(
//                               color: secondGreenColor,
//                               borderRadius: BorderRadius.circular(800)
//                               // borderRadius: BorderRadius.only(
//                               //   topRight: Radius.circular(350),
//                               //   topLeft: Radius.circular(350)
//                               // )
//                               ),
//                         ),
//                       ).animate().fade().scale(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       height: 700,
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Container(
//                               width: 420,
//                               height: 680,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: PlatformWebViewWidget(
//                                   PlatformWebViewWidgetCreationParams(
//                                       controller: _controller),
//                                 ).build(context),
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Transform.scale(
//                               scaleX: 1.3,
//                               child: Container(
//                                 width: 350,
//                                 height: 700,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: AssetImage(
//                                             "assets/images/phone.png"),
//                                         fit: BoxFit.contain)),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
