
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/localization/locale_controller.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/main.dart';
import 'package:medsync/modules/choose_account/view/screen/choose_account_screen.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height *0.1,),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Container(
                width: 342,
                height: 155,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logo_app.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TitleAppBold(
                text: 'choose the language'.tr,
                theme: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    color: ColorManager.seventhBlue),
              ),
            ),
          ),
          // const Spacer(),

          SizedBox(height: 20,),
          Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ItemSelectLang(
                  text: 'Arabic'.tr,onTap: (){
                  changeLang(codeLang: 'ar');
                  lang='ar';
                  navigateAndFinish(context,ChooseAccountScreen());


                },
                ),

                ItemSelectLang(
                  text: 'Français'.tr,onTap: (){
                  changeLang(codeLang: 'fr');
                  lang='fr';
                  navigateAndFinish(context,ChooseAccountScreen());
                },
                ),

                ItemSelectLang(
                  text: 'English'.tr,onTap: (){
                  changeLang(codeLang: 'en');
                  lang='en';
                  navigateAndFinish(context,ChooseAccountScreen());
                },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemSelectLang extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ItemSelectLang({
    Key? key,
    required this.text, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 350,
            height: 61,
            child: Container(
              width: 350,
              height: 61,
              decoration: ShapeDecoration(
                color: ColorManager.seventhBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44),
                ),
              ),
              child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        )),
              ),
            ),
          )),
    );
  }
}

class ButtonSelectLang extends StatelessWidget {
  const ButtonSelectLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: Text(
            'Select'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 16,
                color: ColorManager.white),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorManager.secondBlue),
      ),
    );
  }
}
