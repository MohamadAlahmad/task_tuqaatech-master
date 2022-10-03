import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_tuqaatech/controller/controller.dart';
import 'package:task_tuqaatech/screens/dialogs/sign_in_req.dart';
import 'package:task_tuqaatech/screens/fragments/background.dart';
import 'package:task_tuqaatech/screens/fragments/button.dart';
import 'package:task_tuqaatech/screens/fragments/footer.dart';
import 'package:task_tuqaatech/screens/fragments/text_field.dart';
import 'package:task_tuqaatech/utilities/global.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String profileImage = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genederController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  late MyTextField nameWidget = MyTextField(
    controller: nameController,
    type: MyTextFieldType.name,
  );
  late MyTextField ageWidget = MyTextField(
    controller: ageController,
    type: MyTextFieldType.age,
  );
  late MyTextField genderWidget = MyTextField(
    controller: genederController,
    type: MyTextFieldType.gender,
  );
  late MyTextField countryWidget = MyTextField(
    controller: countryController,
    type: MyTextFieldType.country,
  );
  late MyTextField cityWidget = MyTextField(
    controller: cityController,
    type: MyTextFieldType.city,
    neededController: countryController,
  );
  late MyTextField phonNumberWidget = MyTextField(
    controller: phoneNumberController,
    type: MyTextFieldType.phoneNumber,
  );
  late MyTextField emailWidget = MyTextField(
    controller: emailController,
    type: MyTextFieldType.email,
  );
  late MyTextField passwordWidget = MyTextField(
    controller: passwordController,
    type: MyTextFieldType.password,
  );
  late MyTextField rePasswordWidget = MyTextField(
    controller: rePasswordController,
    type: MyTextFieldType.rePassword,
    neededController: passwordController,
  );
  clearImage() {
    setState(() {
      profileImage = '';
    });
  }

  Future getImage() async {
    askForPermission().then((value) async {
      if (value) {
        final pickedFile = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 20);
        if (null == pickedFile) return;
        setState(() {
          profileImage = pickedFile.path;
        });
      } else {
        Globals.scaffoldKey.currentState!.showSnackBar(const SnackBar(
          content: Text(MyStrings.noPermission),
        ));
        return;
      }
    });
  }

  Future<bool> askForPermission() async {
    bool isGranted = await Permission.storage.isGranted;
    if (!isGranted) {
      Permission.storage.request().then((value) {
        if (value.isGranted) {
          return true;
        } else {
          return false;
        }
      });
    }
    return true;
  }

  Future<void> _launchInBrowser(BuildContext context, Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      Globals.scaffoldKey.currentState!.showSnackBar(const SnackBar(
        content: Text(MyStrings.cannotLaunchUri),
      ));
    }
  }

  bool acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundFragment(image: MyAssets.backgroundWithWhite),
        Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.signup,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                //image picker
                Container(
                  height: 120,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        AnimatedCrossFade(
                          firstChild: Container(
                            height: 120,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Globals.greyColor, width: 2)),
                            child: IconButton(
                                icon: SvgPicture.string(MyAssets.image),
                                onPressed: () {
                                  getImage();
                                }),
                          ),
                          crossFadeState: profileImage.isEmpty
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 300),
                          secondChild: Container(
                            height: 120,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        Image.file(File(profileImage)).image),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Globals.greyColor, width: 2)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: SvgPicture.string(MyAssets.editImage),
                                onPressed: () {
                                  clearImage();
                                }),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 32,
                ),
                nameWidget,
                const SizedBox(
                  height: 8,
                ),
                ageWidget,
                const SizedBox(
                  height: 8,
                ),
                genderWidget,
                const SizedBox(
                  height: 8,
                ),
                countryWidget,
                const SizedBox(
                  height: 8,
                ),
                cityWidget,
                const SizedBox(
                  height: 8,
                ),
                phonNumberWidget,
                const SizedBox(
                  height: 8,
                ),
                emailWidget,
                const SizedBox(
                  height: 8,
                ),
                passwordWidget,
                const SizedBox(
                  height: 8,
                ),
                rePasswordWidget,
                const SizedBox(
                  height: 8,
                ),
                //ACCEPT TERMS
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
                                acceptTerms = value;
                              });
                            }
                          },
                          value: acceptTerms,
                        ),
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Accept the ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: acceptTerms
                                          ? Globals.orangeColor
                                          : Globals.greyColor),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchInBrowser(context,
                                          Uri.https('www.tuqaatech.com', ''));
                                    },
                                  text: 'Terms & Services',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: acceptTerms
                                              ? Globals.orangeColor
                                              : Globals.greyColor,
                                          decoration: TextDecoration.underline),
                                )
                              ])),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                MyButton(
                    title: MyStrings.signup,
                    onClick: () async {
                      if (!acceptTerms) {
                        Globals.scaffoldKey.currentState!.showSnackBar(
                            const SnackBar(
                                content: Text('Please accept the terms')));
                      } else {
                        if (profileImage.isNotEmpty &&
                            nameWidget.isValid &&
                            ageWidget.isValid &&
                            emailWidget.isValid &&
                            countryWidget.isValid &&
                            cityWidget.isValid &&
                            genderWidget.isValid &&
                            phonNumberWidget.isValid &&
                            passwordWidget.isValid &&
                            rePasswordWidget.isValid) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });

                          final bytes = File(profileImage).readAsBytesSync();

                          String img64 = base64Encode(bytes);

                          await MyConnectionController.signup(
                                  name: nameController.text,
                                  gender: genderWidget.value,
                                  age: int.parse(ageController.text),
                                  cityId: cityWidget.value,
                                  countryId: countryWidget.value,
                                  phoneNumber: phoneNumberController.text,
                                  emailAddress: emailController.text,
                                  password: passwordController.text,
                                  avatar: img64)
                              .then((value) {
                            if (value) {
                              Timer(const Duration(milliseconds: 100), () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const SignInRequiredScreen());
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
                                  content:
                                      Text('Please check unvalid values')));
                        }
                      }
                    }),
                FooterFragment(
                  inLoginScreen: false,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
