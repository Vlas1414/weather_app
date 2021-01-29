import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/ui/screens/splash_screen.dart';

void main() {
  runApp(EasyLocalization(
    path: 'assets/lang',
    saveLocale: true,
    supportedLocales: [
      Locale('ru', 'RU'),
      Locale('en', 'EN'),
    ],
    fallbackLocale: Locale('en', 'EN'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorsApp.headBackgraund,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
    );
  }
}
