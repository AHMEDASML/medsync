import 'package:flutter/material.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/string_app.dart';
import 'package:medsync/modules/auth/login/view/screen/login_screen.dart';
import 'package:medsync/modules/auth/registration/view/screen/registration_screen.dart';

class AccountText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String type;

  const AccountText(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleAppBold(
            text: firstText, theme: Theme.of(context).textTheme.bodyMedium),
        InkWell(
          onTap: () => navigateAndFinish(context,
              type == 'registration' ? const LoginScreen() : const RegistrationScreen()),
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: TitleAppBold(
            text: secondText,
            theme: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
