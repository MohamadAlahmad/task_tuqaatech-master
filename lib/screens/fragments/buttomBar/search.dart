import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class searchComponent extends StatelessWidget {
  bool isActive;
  Function onTab;
  searchComponent({
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
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Globals.orangeColor : Globals.greyColor),
            child: SvgPicture.string(
              MyAssets.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}