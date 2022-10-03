
import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/fragments/background.dart';
import 'package:task_tuqaatech/screens/fragments/button.dart';
import 'package:task_tuqaatech/screens/login.dart';
import 'package:task_tuqaatech/screens/signup.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundFragment(image: MyAssets.background),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                MyStrings.login2Continue,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              MyButton(
                  title: MyStrings.login,
                  onClick: () {
                  
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              const SizedBox(
                height: 8,
              ),
              MyButton(
                  title: MyStrings.signup,
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  outLine: true),
            ],
          ),
        ],
      ),
    );
  }
}


