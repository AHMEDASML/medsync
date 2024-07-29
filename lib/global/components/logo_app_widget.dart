import 'package:flutter/material.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      "assets/images/medsync-logo.png",
      height: 155,
      width: 134,
      fit: BoxFit.fill,
    );
  }
}
