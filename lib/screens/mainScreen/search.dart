import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/fragments/button.dart';
import 'package:task_tuqaatech/screens/fragments/text_field.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class SearchHomeScreen extends StatefulWidget {
  const SearchHomeScreen({Key? key}) : super(key: key);

  @override
  State<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {
  TextEditingController genederController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController ageControllerBetween = TextEditingController();
  TextEditingController ageControllerTo = TextEditingController();

  TextEditingController dateControllerTo = TextEditingController();

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
  late MyTextField dateWidget = MyTextField(
    controller: dateControllerTo,
    type: MyTextFieldType.date,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        countryWidget,
        const SizedBox(
          height: 8,
        ),
        cityWidget,
        const SizedBox(
          height: 8,
        ),
        genderWidget,
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 8,
          ),
          child: Text(
            "Partners's age: ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(
                  MyStrings.between,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: MyTextField(
                  controller: ageControllerBetween,
                  type: MyTextFieldType.ageBetween,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(
                  MyStrings.to,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: MyTextField(
                  controller: ageControllerTo,
                  type: MyTextFieldType.ageTo,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        dateWidget,
        const SizedBox(
          height: 8,
        ),
        MyButton(title: 'Search', onClick: (){})
      ]),
    );
  }
}
