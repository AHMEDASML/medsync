import 'package:flutter/material.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/string_app.dart';
import 'package:medsync/modules/auth/login/view/screen/login_screen.dart';
import 'package:medsync/modules/layout/view/layout_screen.dart';

class ButtonAuth extends StatefulWidget {
  final String titleButton;
  final void Function() onTap;


  const ButtonAuth({Key? key, required this.titleButton, required this.onTap}) : super(key: key);

  @override
  State<ButtonAuth> createState() => _ButtonAuthState();
}

class _ButtonAuthState extends State<ButtonAuth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [ColorManager.firstBlue, ColorManager.secondBlue],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Center(
            child: TitleAppBold(
              text: widget.titleButton,
              theme: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
