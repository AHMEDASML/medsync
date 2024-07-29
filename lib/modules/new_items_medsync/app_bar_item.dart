import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class AppBarItem extends StatelessWidget {
  final String text;
  final String? titleName;
  final Widget icon;
  final void Function()? onTap;

  const AppBarItem(
      {Key? key,
      required this.text,
      this.titleName,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(onTap: onTap, child: icon),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.black,
                    size: 24,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
