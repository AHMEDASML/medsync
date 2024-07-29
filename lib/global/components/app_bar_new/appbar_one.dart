import 'package:flutter/material.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';

AppBar appbarOne(
        {required BuildContext context,
        required String text,
        required Widget firstIcon}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        textAlign: TextAlign.center,
        text,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 0,
              color: ColorManager.firstBlack,
            ),
      ),
      elevation: 0.0,
      actions: [firstIcon],
    );
