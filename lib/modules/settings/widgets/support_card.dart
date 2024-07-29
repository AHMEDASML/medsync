import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/font_size.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.support_agent,
            size: 50,
            color: ColorManager.fourthBlue,
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: Text(
              "Feel Free to Ask, We Ready to Help".tr,
              style: TextStyle(
                fontSize: ksmallFontSize,
                color: ColorManager.fourthBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
