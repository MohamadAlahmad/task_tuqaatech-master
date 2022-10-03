import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:task_tuqaatech/model/city.dart';
import 'package:task_tuqaatech/model/country.dart';
import 'package:task_tuqaatech/model/gender.dart';
import 'package:task_tuqaatech/screens/dialogs/city.dart';
import 'package:task_tuqaatech/screens/dialogs/country.dart';
import 'package:task_tuqaatech/screens/dialogs/gender.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class MyTextField extends StatefulWidget {
  TextEditingController controller;
  TextEditingController? neededController;
  dynamic value = 0;

  MyTextFieldType type;
  bool isValid = false;
  MyTextField({
    required this.controller,
    required this.type,
    this.neededController,
    Key? key,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureText = false;
  String hintText = '';
  String? icon;
  TextInputType textInputType = TextInputType.text;
  bool dropdown = false;
  Function checkMethod = () {};
  Function ontabMethod = () {};

  @override
  void initState() {
    switch (widget.type) {
      case MyTextFieldType.date:
        obscureText = false;
        hintText = MyStrings.date;
        icon = MyAssets.date;
        textInputType = TextInputType.datetime;
        dropdown = true;
        ontabMethod = () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2024))
              .then((value) {
            if (value != null) {
              setState(() {
                widget.controller.text = DateFormat('yyyy/MM/dd').format(value);
                widget.isValid = true;
                widget.value = value;
              });
            }
          });
        };
        checkMethod = (String value) {
          if (value.length == 0) {
            widget.isValid = false;
          } else if (value.length == 1) {
            widget.isValid = true;
          }
        };
        break;
      case MyTextFieldType.name:
        obscureText = false;
        hintText = MyStrings.name;
        icon = null;
        textInputType = TextInputType.text;
        dropdown = false;
        checkMethod = (String value) {
          if (value.length == 0) {
            widget.isValid = false;
          } else if (value.length == 1) {
            widget.isValid = true;
          }
        };
        break;
      case MyTextFieldType.email:
        obscureText = false;
        hintText = MyStrings.email;
        icon = MyAssets.email;
        textInputType = TextInputType.emailAddress;
        dropdown = false;
        checkMethod = (String value) {
          if (value.isNotEmpty && value.contains('@') && value.contains('.')) {
            widget.isValid = true;
          } else if (value.length == 1) {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.password:
        obscureText = true;
        hintText = MyStrings.password;
        icon = MyAssets.password;
        textInputType = TextInputType.visiblePassword;
        dropdown = false;
        checkMethod = (String value) {
          if (value.length > 5) {
            widget.isValid = true;
          } else {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.rePassword:
        obscureText = true;
        hintText = MyStrings.rePassword;
        icon = MyAssets.password;
        textInputType = TextInputType.visiblePassword;
        dropdown = false;
        checkMethod = (String value) {
          if (widget.neededController == null) {
            widget.isValid = false;
          } else {
            if (value == widget.neededController!.text) {
              widget.isValid = true;
            } else {
              widget.isValid = false;
            }
          }
        };
        break;
      case MyTextFieldType.age:
        obscureText = false;
        hintText = MyStrings.age;
        icon = null;
        textInputType = TextInputType.number;
        dropdown = false;
        checkMethod = (String value) {
          int? num = int.tryParse(value);
          if (num == null) {
            widget.isValid = false;
          } else {
            if (num > 18 && num < 100) {
              widget.isValid = true;
            } else {
              widget.isValid = false;
            }
          }
        };
        break;
      case MyTextFieldType.gender:
        obscureText = false;
        hintText = MyStrings.gender;
        icon = MyAssets.arrow;
        textInputType = TextInputType.text;
        dropdown = true;
        ontabMethod = () {
          showDialog(context: context, builder: (context) => GenderDialog())
              .then((value) {
            if (value != null && value is Gender) {
              setState(() {
                widget.controller.text = value.name;
                widget.value = value.id;
                widget.isValid = true;
              });
            }
          });
        };
        checkMethod = (String value) {
          if (value.isNotEmpty) {
            widget.isValid = true;
          } else {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.city:
        obscureText = false;
        hintText = MyStrings.city;
        icon = MyAssets.arrow;
        textInputType = TextInputType.text;
        dropdown = true;
        ontabMethod = () {
          showDialog(context: context, builder: (context) => const CityDialog())
              .then((value) {
            if (value != null && value is City) {
              setState(() {
                widget.controller.text = value.name;
                widget.value = value.id;
                widget.isValid = true;
              });
            }
          });
        };
        checkMethod = (String value) {
          if (value.isNotEmpty) {
            widget.isValid = true;
          } else {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.country:
        obscureText = false;
        hintText = MyStrings.country;
        icon = MyAssets.arrow;
        textInputType = TextInputType.text;
        dropdown = true;
        ontabMethod = () {
          showDialog(
              context: context,
              builder: (context) => const CountryDialog()).then((value) {
            if (value != null && value is Country) {
              setState(() {
                widget.controller.text = value.name;
                widget.value = value.id;
                widget.isValid = true;
              });
            }
          });
        };
        checkMethod = (String value) {
          if (value.isNotEmpty) {
            widget.isValid = true;
          } else {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.phoneNumber:
        obscureText = false;
        hintText = MyStrings.phone;
        icon = null;
        textInputType = TextInputType.phone;
        dropdown = false;
        checkMethod = (String value) {
          if ((value.startsWith('00') || value.startsWith('+')) &&
              value.length > 10 &&
              value.length < 15) {
            widget.isValid = true;
          } else {
            widget.isValid = false;
          }
        };
        break;
      case MyTextFieldType.ageBetween:
        obscureText = false;
        hintText = MyStrings.between;
        icon = null;
        textInputType = TextInputType.number;
        dropdown = false;
        checkMethod = (String value) {
          int? num = int.tryParse(value);
          if (num == null) {
            widget.isValid = false;
          } else {
            if (num > 18 && num < 100) {
              widget.isValid = true;
            } else {
              widget.isValid = false;
            }
          }
        };
        break;
      case MyTextFieldType.ageTo:
        obscureText = false;
        hintText = MyStrings.to;
        icon = null;
        textInputType = TextInputType.number;
        dropdown = false;
        checkMethod = (String value) {
          int? num = int.tryParse(value);
          if (num == null) {
            widget.isValid = false;
          } else {
            if (num > 18 && num < 100) {
              widget.isValid = true;
            } else {
              widget.isValid = false;
            }
          }
        };
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: Row(children: [
        Container(
          width: 40,
        ),
        Expanded(
          child: TextField(
            controller: widget.controller,
            readOnly: dropdown,
            obscureText: obscureText,
            obscuringCharacter: '*',
            keyboardType: textInputType,
            onTap: () {
              if (dropdown) {
                ontabMethod();
              }
            },
            onChanged: (value) {
              checkMethod(value);
              setState(() {});
            },
            decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: icon == null
                        ? Container()
                        : AnimatedCrossFade(
                            firstChild: SvgPicture.string(icon!,
                                color: Globals.greyColor),
                            secondChild: SvgPicture.string(icon!,
                                color: Globals.orangeColor),
                            crossFadeState: widget.isValid
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300)))),
          ),
        ),
        Container(
          width: 40,
          child: Center(
            child: AnimatedOpacity(
              opacity: widget.isValid ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.string(
                MyAssets.check,
                color: Globals.orangeColor,
                width: 18,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

enum MyTextFieldType {
  name,
  age,
  email,
  password,
  rePassword,
  city,
  country,
  gender,
  phoneNumber,
  ageBetween,
  ageTo,
  date
}
