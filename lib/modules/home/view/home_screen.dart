import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/icon_app_screen.dart';
import 'package:medsync/global/components/serch_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/endpoints/list_categories_doctors.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/global/utils/string_app.dart';
import 'package:medsync/modules/doctor/view/screen/doctor_screen.dart';
import 'package:medsync/modules/doctor/view/screen/specializations_screen.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/home/view/widget/book_card_now_home.dart';
import 'package:medsync/modules/home/view/widget/item_competence.dart';
import 'package:medsync/modules/home/view/widget/item_home_page.dart';
import 'package:medsync/modules/home/view/widget/page_view_medsync_home.dart';
import 'package:medsync/modules/home/view/widget/question_item.dart';
import 'package:medsync/modules/home/view/widget/search_home.dart';
import 'package:medsync/modules/medicines/view/screen/pharmacies_screen.dart';
import 'package:medsync/modules/notifications/view/notifications_screen.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/search_medicines_screen.dart';
import 'package:medsync/modules/states/view/states_screen.dart';

import '../../meds/view/screen/meds_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (con) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 6, left: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/medsync.png',
                      height: 35,
                      width: 117,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Center(
                  child: TitleAppBold(
                    text: 'what are you looking for ?'.tr,
                    theme: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // SearchApp(textStatus: true, controller: search),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    ItemHomePage(
                      title: 'Pharmacies'.tr,
                      onTap: () {
                        navigateTo(
                            context,
                            const StatesScreen(
                              imageTitle: 'assets/images/home2.png',
                              nameM: 'farma',
                            ));
                      },
                      icon: Icon_app.pharmacy,
                      urlImage: 'assets/images/home2.png',
                      heightImage: 85,
                      widthImage: 81,
                    ),



                    ItemHomePage(
                      title: 'Doctors'.tr,
                      onTap: () {
                        navigateTo(context, const SpecializationsScreen());
                      },
                      icon: Icon_app.home_quarantine__dark,
                      urlImage: 'assets/images/doctor11.png',
                      heightImage: 90,
                      widthImage: 100,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemHomePage(
                      title: 'Medicines'.tr,
                      onTap: () {
                        navigateTo(context, MedsScreen());
                      },
                      icon: Icon_app.syringe,
                      urlImage: 'assets/images/home3.png',
                      heightImage: 85,
                      widthImage: 81,
                    ),
                    ItemHomePage(

                      title: 'laboratories'.tr,
                      onTap: () {
                        navigateTo(
                            context,
                            const StatesScreen(
                              imageTitle: 'assets/images/home11.png',
                              nameM: 'laboratories',
                            ));
                      },
                      icon: Icon_app.i_exam_qualification_dark,
                      urlImage: 'assets/images/home11.png',
                      heightImage: 85,
                      widthImage: 81,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // PageViewMedsyncHome(),
                // BookCardNowHome(),

                const SizedBox(
                  height: 20,
                ),
                QuestionItem(

                    urlImage: 'assets/json_gif/01 What is MedSync.json',
                    text: stringHome[0].tr),
                QuestionItem(
                    urlImage:
                        'assets/json_gif/02 Learn about the features.json',
                    text: '',
                    title: "Explore the app's features.".tr),

                QuestionItem(
                    forThe: 'For the'.tr,
                    urlImage: 'assets/json_gif/03 Doctor.json',
                    text: stringHome[2].tr,
                    title: "For doctors".tr),

                QuestionItem(
                    forThe: 'For the'.tr,
                    urlImage: 'assets/json_gif/04 laboratories.json',
                    text: stringHome[3].tr,
                    title: "For laboratories".tr),

                QuestionItem(
                    forThe: 'For the'.tr,
                    urlImage: 'assets/json_gif/05 pharmacies.json',
                    text: stringHome[4].tr,
                    title: "For pharmacy".tr),

                QuestionItem(
                    forThe: 'For the'.tr,
                    urlImage: 'assets/json_gif/Notices 06.json',
                    text: stringHome[5].tr,
                    title: "For notifications".tr),

                QuestionItem(
                    forThe: 'For the'.tr,
                    urlImage: 'assets/json_gif/07 true.json',
                    text: stringHome[6].tr,
                    title: "The Medical Magazine".tr),
              ],
            )),
          );
        });
  }
}
