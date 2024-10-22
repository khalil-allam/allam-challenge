import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/coding_files/shared_pref.dart';
import 'package:allam_challenge/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'splash_page.dart';
import 'webview.dart';
import 'webview_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initSharedPref();
  // await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'خليل',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: mainGreenColor),
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home:
//       HomeScreen(
//         inputText: """صحح لي النص الشعري ذهبت الى البيت ووجدت امي سعيدة
// وابي وجدته بانتظاري وكذلك جميع العائلة

// يالها من لحظة مشرقة
// الحمد لله دائماً وابداً وكل يوم بمعايير التصحيح قـافية""",
//       )
          const SplashPage(),
      // const WebViewExample(),
    );
  }
}
