import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class ButtonOutlinedApp extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final void Function()? onTap;

  const ButtonOutlinedApp(
      {Key? key,
        required this.text,
        this.height,
        this.width,
        this.color,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width ?? 335,
          height: height ?? 66,
          child: Container(

            width: 335,
            height: 66,
            decoration: BoxDecoration(
              color: color ?? ColorManager.white,
                borderRadius: BorderRadius.circular(33),
              border: Border.all(color: ColorManager.seventhBlue)
            ),
            child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.seventhBlue,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  )),
            ),
          ),
        ));
  }
}
