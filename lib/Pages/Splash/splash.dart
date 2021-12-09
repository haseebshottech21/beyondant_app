import 'dart:async';
import 'package:beyondant_new_app/Pages/Dashboard/dashboard.dart';
import 'package:beyondant_new_app/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String? finalToken;
// String? finalRefreshToken;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
    // getValidationData().whenComplete(() {
    // Timer(
    //   const Duration(seconds: 3),
    //   () => navigateUser(),
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => finalToken == '' || finalRefreshToken == ''
    //         ? const LoginScreen()
    //         : const BeyondantDashboard(),
    //   ),
    // );
    // });
  }

  void startTimer() {
    Timer(
      const Duration(seconds: 3),
      () => navigateUser(),
    );
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_token = prefs.getString('token') ?? '';
    var user_refresh_token = prefs.getString('token') ?? '';

    // print(user_token);
    // print(user_refresh_token);

    if (user_token.isNotEmpty || user_refresh_token.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(BeyondantDashboard.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();

  //   var mytoken = sharedPreferences.getString('token');
  //   var refreshToken = sharedPreferences.getString('refresh_token');

  //   setState(() {
  //     finalToken = mytoken;
  //     finalRefreshToken = refreshToken;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/businesscard.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
