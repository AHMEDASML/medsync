import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';





class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal ,
        child: Row(children:  [
          UserInformationItem(textTitle: 'Age'.tr, textBody: '32 years',),
          UserInformationItem(textTitle: 'Gender'.tr, textBody: 'Male',),
          UserInformationItem(textTitle: 'Height'.tr, textBody: '182 CM',),
        ],),
      ),
    );
  }
}



class UserInformationItem extends StatelessWidget {
  final String textTitle;
  final String textBody;

  const UserInformationItem(
      {Key? key, required this.textTitle, required this.textBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1.0,
              blurRadius: 12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            TitleAppBold(
              text: textTitle,
                theme: Theme.of(context).textTheme.bodyLarge
            ),
            TitleAppBold(
              text: textBody,
                theme: Theme.of(context).textTheme.bodyLarge
            ),
          ],
        ),
      ),
    );
  }
}
