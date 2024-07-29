import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/size_app.dart';



class InformationItemUser extends StatelessWidget {
  const InformationItemUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InformationData(text: 'Medical_Record'.tr,),
          InformationData(text: 'Test_result'.tr,),
        ],),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InformationData(text: 'Vaccination'.tr,),
          InformationData(text: 'Prescriptions'.tr,),
        ],),
      ],
    );
  }
}






class InformationData extends StatelessWidget {
  final String text;
  const InformationData({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.sixthBlue,
        ),

        width: SizeApp.screenSize.width / 2.8,
        height: SizeApp.screenSize.height / 4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorManager.fourthBlue,
                radius: 30,
                child: const Icon(Icons.account_balance_wallet,color: Colors.white),
              ),
              const SizedBox(height: 20,),

              TitleAppBold(
                text: text,
                theme: Theme.of(context).textTheme.bodyLarge,
              ),
            ]),
      ),
    );
  }
}
