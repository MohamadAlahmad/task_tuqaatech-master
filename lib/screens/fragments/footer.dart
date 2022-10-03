import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/login.dart';
import 'package:task_tuqaatech/screens/signup.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class FooterFragment extends StatelessWidget {
  bool inLoginScreen;
  FooterFragment({required this.inLoginScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: Globals.greyColor.withOpacity(0.6),
          ),
          Builder(builder: (context) {
            if (inLoginScreen) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.dontHaveAccount,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Globals.greyColor),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUpScreen()));
                            },
                            text: MyStrings.createAccount,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Globals.orangeColor),
                          )
                        ])),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.haveAccount,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Globals.greyColor),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  LoginScreen()));
                              },
                            text: MyStrings.login,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Globals.orangeColor),
                          )
                        ])),
              );
            }
          }),
        ],
      ),
    );
  }
}
