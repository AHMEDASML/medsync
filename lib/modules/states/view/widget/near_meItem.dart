import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';

class NearMeItem extends StatelessWidget {
  const NearMeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Near me'.tr,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.green,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.gps_fixed, color: ColorManager.green),
                  )
                ],
              ),
            ),
            Container(
              width: 339,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: ColorManager.gray3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
