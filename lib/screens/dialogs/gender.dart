import 'package:flutter/material.dart';
import 'package:task_tuqaatech/controller/controller.dart';
import 'package:task_tuqaatech/model/country.dart';
import 'package:task_tuqaatech/model/gender.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class GenderDialog extends StatelessWidget {
  GenderDialog({Key? key}) : super(key: key);

  List<Gender> genders = [
    Gender(id: 0, name: 'Female - أنثى'),
    Gender(name: 'Male - ذكر', id: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
            child: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Globals.backgroundColor,
              border: Border.all(color: Globals.greyColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          child: ListView.separated(
            itemCount: genders.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pop(context, genders[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    genders[index].name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Globals.greyColor,
                height: 2,
              );
            },
          ),
        )));
  }
}
