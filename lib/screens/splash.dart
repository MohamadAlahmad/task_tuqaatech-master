import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/fragments/background.dart';
import 'package:task_tuqaatech/screens/login_signup.dart';
import 'package:task_tuqaatech/screens/main_home.dart';
import 'package:task_tuqaatech/utilities/global.dart';
import 'dart:async';

import 'package:task_tuqaatech/utilities/route.dart';
import 'package:task_tuqaatech/utilities/shared.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AUTO NAVIGATE TO MAIN PAGE AFTER 3 SECONDS
    Timer(
      const Duration(seconds: 3),
      () {   
        if (MyShared.accessToken.isNotEmpty) {
          Navigator.pushReplacement(
              context, CustomRoute(child: const MainScreen()));
        } else {
          Navigator.push(
              context, CustomRoute(child: const LoginSignupScreen()));
        }
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          BackgroundFragment(image: MyAssets.background_welcome),
          Center(
            child: Text(
              MyStrings.welcome,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
