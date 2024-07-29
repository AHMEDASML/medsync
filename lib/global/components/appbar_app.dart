import 'package:flutter/material.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';

class AppbarApp extends StatelessWidget {
  final String text;
  final IconData firstIcon;
  final void Function()? onTapFirstIcon;
  final void Function()? onTapSecondIcon;
  final IconData secondIcon;

  const AppbarApp(
      {Key? key,
      required this.text,
      required this.firstIcon,
      required this.secondIcon,
      this.onTapFirstIcon,
      this.onTapSecondIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleAppBold(
          text: text,
          theme: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: 20,
                child: InkWell(
                  onTap: onTapFirstIcon,
                  child:
                      Icon(size: 20, firstIcon, color: ColorManager.fourthBlue),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: 20,
                child: InkWell(
                  onTap: onTapSecondIcon,
                  child: Icon(
                      size: 20, secondIcon, color: ColorManager.fourthBlue),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
