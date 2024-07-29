


import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';

AppBar appbarNewApp({required BuildContext context,required String textTitle,Widget? actions})=> AppBar(
  backgroundColor: Colors.transparent,
  centerTitle: true,
  title: Text(textTitle,style: Theme.of(context).textTheme.displayMedium!.copyWith(
      color: ColorManager.seventhBlue,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 0,


  ),),
  elevation: 0.0,
  actions: [
    actions ?? Container(),
  ],
);