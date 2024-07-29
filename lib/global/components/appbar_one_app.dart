import 'package:flutter/material.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';

AppBar appbarOneApp(
        {required BuildContext context,
        required String title,
        required String subTitle,
          Widget? icon,

        }) =>
    AppBar(
      centerTitle: true,
      title: Text(title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 22.0,
              color: ColorManager.firstBlack,
              fontWeight: FontWeight.w500)),
      leading: Icon(Icons.arrow_back_ios_new, color: ColorManager.firstBlack),
      elevation: 0.0,
      backgroundColor: ColorManager.thirdWhite,
      actions: [
        Padding(
          padding:   EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(subTitle,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.0,
                      color: ColorManager.secondBlue,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: 10,
              ),
              icon ?? Container()
              // Icon(Icon_app.poison, color: ColorManager.blueEighth, size: 28),
            ],
          ),
        ),
      ],
    );
