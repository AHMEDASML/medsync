import 'package:flutter/material.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';

Widget dateAppointment(
    {required BuildContext context,
    required String text,
    required IconData icon}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        color: ColorManager.sixthBlue, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Icon(icon, color: ColorManager.firstBlack, size: 15),
        SizedBox(width: 6),
        TitleAppBold(
          text: text,
          theme: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
