import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class WelcomeHomeScreen extends StatelessWidget {
  const WelcomeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(MyAssets.welcome),
    );
  }
}
