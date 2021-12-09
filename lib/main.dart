import 'dart:io';
import 'package:beyondant_new_app/Pages/Dashboard/dashboard.dart';
import 'package:beyondant_new_app/Pages/Login/login.dart';
import 'package:beyondant_new_app/Pages/Splash/splash.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/SocialMediaPlatform/social_medial_platform.dart';
import 'Pages/UserManagment/user_management.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // MyApp.userRole = await getSharedPrefenceValue('userRole');
  // print(MyApp.userRole);
  runApp(const MyApp());
}

SharedPreferences? localStorage;

class MyApp extends StatelessWidget {
  // static String userRole = '';
  const MyApp({Key? key}) : super(key: key);

  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // color: Colors.transparent,
      theme: ThemeData(
        // primarySwatch: Colors.transparent,
        appBarTheme: AppBarTheme.of(context),
      ),
      home: const Splash(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        BeyondantDashboard.routeName: (context) => const BeyondantDashboard(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
