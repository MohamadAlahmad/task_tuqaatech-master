

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class messageComponent extends StatelessWidget {
  bool isActive;
  Function onTab;
  messageComponent({
    required this.isActive,
    required this.onTab,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.string(
            MyAssets.message,
            color: isActive ? Globals.orangeColor : Globals.greyColor,
          ),
          const SizedBox(height: 6),
          Text(
            'Message',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: isActive ? Globals.orangeColor : Globals.greyColor),
          )
        ],
      ),
    );
  }
}