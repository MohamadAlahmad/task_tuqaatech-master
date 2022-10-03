import 'package:flutter/material.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class MyButton extends StatelessWidget {
  String title;
  Function onClick;
  bool outLine = false;
  MyButton({
    required this.title,
    required this.onClick,
    this.outLine = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (outLine) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: RaisedButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            onPressed: () {
              onClick();
            },
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Globals.orangeColor),
            ),
            color: Globals.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Globals.orangeColor, width: 1)),
          ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        color: Globals.orangeColor,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        onPressed: () {
          onClick();
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
