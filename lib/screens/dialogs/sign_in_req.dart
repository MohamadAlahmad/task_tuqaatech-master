import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/fragments/button.dart';
import 'package:task_tuqaatech/screens/login.dart';

class SignInRequiredScreen extends StatelessWidget {
  const SignInRequiredScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
          color: Colors.white.withOpacity(0.5),
          child: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 8,
                  sigmaY: 8,
                  tileMode: TileMode.clamp),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign in!',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Please sign in to continue to the app.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyButton(
                        title: 'Done',
                        onClick: () {
                          Navigator.of(context).popUntil(
                              (route) => route.isFirst);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen()));
                        })
                  ],
                ),
              ),
            ),
          ),
        );
  }
}