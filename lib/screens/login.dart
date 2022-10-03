import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_tuqaatech/controller/controller.dart';
import 'package:task_tuqaatech/screens/fragments/background.dart';
import 'package:task_tuqaatech/screens/fragments/button.dart';
import 'package:task_tuqaatech/screens/fragments/footer.dart';
import 'package:task_tuqaatech/screens/fragments/text_field.dart';
import 'package:task_tuqaatech/screens/main_home.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool saveLogin = false;

  late MyTextField emailWidget = MyTextField(
    controller: _controllerEmail,
    type: MyTextFieldType.email,
  );

  late MyTextField passwordWidget = MyTextField(
    controller: _controllerPassword,
    type: MyTextFieldType.password,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundFragment(image: MyAssets.backgroundWithWhite),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Text(
                  MyStrings.login,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(
                  flex: 3,
                ),
                emailWidget,
                const SizedBox(
                  height: 8,
                ),
                passwordWidget,
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: Globals.orangeColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          splashRadius: 0,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                saveLogin = value;
                              });
                            }
                          },
                          value: saveLogin,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            saveLogin = !saveLogin;
                          });
                        },
                        child: Text(
                          MyStrings.rememberMe,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: saveLogin
                                      ? Globals.orangeColor
                                      : Globals.greyColor),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MyButton(
                    title: MyStrings.login,
                    onClick: () async {
                      if (emailWidget.isValid && passwordWidget.isValid) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        await MyConnectionController.signin(
                                userNameOrEmailAddress: _controllerEmail.text,
                                password: _controllerPassword.text,
                                rememberClient: saveLogin)
                            .then((value) {
                          if (value) {
                            Timer(const Duration(milliseconds: 100), () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            });
                          }
                        }).onError((error, stackTrace) {
                          Globals.scaffoldKey.currentState!.showSnackBar(
                              SnackBar(content: Text(error.toString())));
                        }).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      } else {
                        Globals.scaffoldKey.currentState!.showSnackBar(
                            const SnackBar(
                                content: Text('Please check unvalid values')));
                      }
                      MyConnectionController.signin(
                          userNameOrEmailAddress: _controllerEmail.text,
                          password: _controllerPassword.text,
                          rememberClient: saveLogin);
                    }),
                const SizedBox(
                  height: 8,
                ),
                const Spacer(flex: 3),
                FooterFragment(
                  inLoginScreen: true,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
