import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medsync/global/utils/color_app.dart';

final pages = [


  PageModel.withChild(
      bodyColor: ColorManager.firstBlack,
      titleColor: ColorManager.secondBlue,
      color: ColorManager.white,
      child: Column(
        children: [
          Lottie.asset('assets/json_gif/animation_llz45mtl.json',
              height: 500, width: 500),
           TitleBodeSplash(
            title: 'Medsync'.tr,
            body: 'Everything you need in your medical life'.tr,
          )
        ],
      ),
      doAnimateChild: true),



  PageModel.withChild(
      bodyColor: ColorManager.firstBlack,
      titleColor: ColorManager.secondBlue,
      color: ColorManager.white,
      child: Column(
        children: [
          Lottie.asset('assets/json_gif/animation_llz47d1v.json',
              height: 500, width: 500),
           TitleBodeSplash(
            title: 'The Doctor'.tr,
            body: 'All that the doctor and the user need now in one application'.tr,
          )
        ],
      ),
      doAnimateChild: true),


  PageModel.withChild(
      bodyColor: ColorManager.firstBlack,
      titleColor: ColorManager.secondBlue,
      color: ColorManager.white,
      child: Column(
        children: [
          Lottie.asset('assets/json_gif/animation_llz47p7n.json',
              height: 500, width: 500),
            TitleBodeSplash(
            title: 'Pharmacies'.tr,
            body: 'Search for a specific drug or the pharmacy you need and it will link you to it'.tr,
          )
        ],
      ),
      doAnimateChild: true),




  // PageModel(
  //     bodyColor: ColorManager.firstBlack,
  //     titleColor: ColorManager.secondBlue,
  //     color: ColorManager.white,
  //     imageAssetPath: 'assets/images/test4.png',
  //     title: 'Medical laboratories',
  //     body: 'Everything that connects the user to the detective (conducting analyzes , prescribing analyzes ,etc....)',
  //     doAnimateImage: true),



  // PageModel.withChild(
  //     bodyColor: ColorManager.firstBlack,
  //     titleColor: ColorManager.secondBlue,
  //     color: ColorManager.white,
  //     child: Image.asset('assets/images/test1.gif', width: 500.0, height: 500.0),
  //     doAnimateChild: true)
];

class TitleBodeSplash extends StatelessWidget {
  final String title;
  final String body;

  const TitleBodeSplash({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Medsync',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: ColorManager.secondBlue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'All that the doctor and the user need now in one application',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
