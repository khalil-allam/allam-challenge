import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/coding_files/shared_pref.dart';
import 'package:allam_challenge/scroll_behavior.dart';
import 'package:allam_challenge/theme_provider.dart';
import 'package:allam_challenge/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'coding_files/shared.dart';
import 'splash_page.dart';
import 'themes.dart';
import 'webview.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initSharedPref();
  await dotenv.load(fileName: "assets/.env");
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'خليل',
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          locale: const Locale('ar', 'YE'),
          supportedLocales: const [
            Locale('ar', 'YE'),
          ],
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
          home: const SplashPage(), //official starter application page
          // home: const KhalilWebPage(), //webpage only for running in chrome and testing the khalil-app.io page
        );
      },
    );
  }
}
