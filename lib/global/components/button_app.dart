import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class ButtonApp extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final double? fontSize;
  final void Function()? onTap;
  final double? circular;

  const ButtonApp(
      {Key? key,
      required this.text,
      this.height,
      this.width,
      this.color,
      this.onTap, this.circular, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width ?? 325,
          height: height ?? 66,
          child: Container(
            width: 335,
            height: 66,
            decoration: ShapeDecoration(
              color: color ?? ColorManager.seventhBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circular ?? 33),
              ),
            ),
            child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.white,
                        fontSize:  fontSize ??22,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      )),
            ),
          ),
        ));
  }
}
