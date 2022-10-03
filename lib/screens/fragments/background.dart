import 'package:flutter/material.dart';

class BackgroundFragment extends StatelessWidget {
  String image;
  BackgroundFragment({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
