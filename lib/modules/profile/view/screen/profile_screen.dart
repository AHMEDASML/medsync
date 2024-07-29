import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_arithmetic_app.dart';
import 'package:medsync/global/components/appbar_app.dart';
import 'package:medsync/global/components/choose_the_new_language.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/size_app.dart';
import 'package:medsync/modules/profile/controller/profile_controller.dart';
import 'package:medsync/modules/profile/view/screen/edit_account_screen.dart';
import 'package:medsync/modules/profile/view/widget/Information_data.dart';
import 'package:medsync/modules/profile/view/widget/terms_and_conditions_button.dart';
import 'package:medsync/modules/profile/view/widget/user_information_item.dart';

import 'package:medsync/modules/settings/view/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final con = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: GetBuilder<ProfileController>(
        builder: (con) {
          if (!con.loading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: loadingAppWidget()),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppbarApp(
              //     text: 'Profile'.tr,
              //     firstIcon: Icons.edit,
              //     onTapFirstIcon: () {
              //       navigateTo(context, const EditAccountScreen());
              //     },
              //     onTapSecondIcon: () {
              //       navigateTo(context, const SettingsScreen());
              //     },
              //     secondIcon: Icons.settings),

              AppBarRowArithmeticApp(
                isActivated: true,
                titleName: con.profileModel!.data.firstName,
                text: 'Arithmetic'.tr,
                icon: Icon(Icons.edit, color: ColorManager.white, size: 26),
                onTap: () {
                  navigateTo(context, const EditAccountScreen());
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textTitleProfile(context: context, text: 'last name'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.lastName),

                    textTitleProfile(context: context, text: 'Email'.tr),
                    textTitleProfileData(
                        context: context, text: con.profileModel!.data.email),

                    textTitleProfile(context: context, text: 'phone number'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.phone.toString()),

                    textTitleProfile(context: context, text: 'Age'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.age.toString()),

                    textTitleProfile(context: context, text: 'gender'.tr),
                    textTitleProfileData(
                        context: context, text: con.profileModel!.data.gender),

                    textTitleProfile(
                        context: context, text: 'medical history'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.medicalHistory),

                    textTitleProfile(context: context, text: 'allergies'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.allergies),

                    textTitleProfile(
                        context: context, text: 'current medications'.tr),
                    textTitleProfileData(
                        context: context,
                        text: con.profileModel!.data.currentMedications),

                    textTitleProfile(context: context, text: 'language'.tr),
                    const ChooseTheNewLanguage(),

                    const SizedBox(height: 20),
                    // Add some space before the button
                    termsAndConditionsButton(context),
                    const SizedBox(height: 20),
                    // Add some space after the button
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }
}

Widget textTitleProfile({required BuildContext context, required String text}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: ColorManager.seventhBlue,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 0,
        ),
  );
}

Widget textTitleProfileData(
    {required BuildContext context, required String text}) {
  return Text(
    text.isEmpty ? "There is no".tr : text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: ColorManager.grey6,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 0,
        ),
  );
}
