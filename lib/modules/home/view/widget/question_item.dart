import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medsync/global/utils/color_app.dart';

class QuestionItem extends StatelessWidget {
  final String urlImage;
  final String text;
  final String? title;
  final String? forThe;

  const QuestionItem(
      {Key? key, required this.urlImage, required this.text, this.title, this.forThe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 354,
        decoration: ShapeDecoration(
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          shadows: [
            BoxShadow(
              color: ColorManager.black2,
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Lottie.asset(urlImage, height: 280, width: 280),
            title == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''.tr,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorManager.grey3,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  )),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/images/medsync.png",
                        height: 35,
                        width: 117,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(forThe ?? "",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.seventhBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    Text(title ?? '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorManager.seventhBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            )),
                  ],
                ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 318,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(text,
                    // textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
