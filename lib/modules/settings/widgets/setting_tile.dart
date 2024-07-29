import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/font_size.dart';
import 'package:medsync/modules/settings/models/setting.dart';


class SettingTile extends StatelessWidget {
  final SettingModel setting;
  const SettingTile({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: GestureDetector(
        onTap: setting.onTap, // Navigation
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(setting.icon, color: ColorManager.secondBlue),
            ),
            const SizedBox(width: 10),
            Text(
              setting.title,
              style: TextStyle(
                color: ColorManager.firstBlack,
                fontSize: ksmallFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Icon(
              CupertinoIcons.chevron_forward,
              color: ColorManager.secondBlue,
            ),
          ],
        ),
      ),
    );
  }
}
