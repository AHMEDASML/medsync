import 'package:flutter/material.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/font_size.dart';
import 'package:medsync/global/utils/key_shared.dart';


class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/avatar.png",
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text(
    CacheHelper.getData(key: NAMEUSER),
              style: TextStyle(
                fontSize: kbigFontSize,
                fontWeight: FontWeight.bold,
                color: ColorManager.secondBlue,
              ),
            ),
            Text(
              '${CacheHelper.getData(key: NUMBERUSER)}',
              style: TextStyle(
                fontSize: ksmallFontSize,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
