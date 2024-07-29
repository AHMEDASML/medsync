import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';

Widget buttonSpecializations({required BuildContext context,void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(

            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ]
            ),
             height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('More specializations'.tr
                  ,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.0,
                      color: ColorManager.secondBlue,
                      fontWeight: FontWeight.w600),


                ),
                const SizedBox(width: 10,),
                Icon(Icons.more_horiz,color: ColorManager.secondBlue,size: 26,)
              ],
            ),)),
    ),
  );
}