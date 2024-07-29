import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/appbar_one.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/endpoints/list_categories_doctors.dart';
import 'package:medsync/global/models/body/specializations_model.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/main.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';
import 'package:medsync/modules/doctor/view/screen/more_specializations_screen.dart';
import 'package:medsync/modules/doctor/view/widget/button_specializations.dart';
import 'package:medsync/modules/home/view/widget/item_competence.dart';
import 'package:medsync/modules/states/view/states_screen.dart';

class SpecializationsScreen extends StatefulWidget {
  const SpecializationsScreen({Key? key}) : super(key: key);

  @override
  State<SpecializationsScreen> createState() => _SpecializationsScreenState();
}

class _SpecializationsScreenState extends State<SpecializationsScreen> {
  final con = Get.find<DoctorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarOne(
            text: 'doctors'.tr,
            firstIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Image.asset(
                'assets/images/doctor11.png',
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
            context: context),
        body: GetBuilder<DoctorController>(builder: (con) {
          if (!con.loading) {
            return loadingAppWidget();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Stack(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 14,
                  ),
                  itemCount: con.specializationsModel
                      .where((specialization) => specialization.icon)
                      .length,
                  itemBuilder: (context, index) {
                    var filteredList = con.specializationsModel
                        .where((specialization) => specialization.icon)
                        .toList();

                    var specialization = filteredList[index];
                    return SpecializationsItem(
                      nameM: specialization.name,
                      id: specialization.id,
                      specializationsModel: specialization,
                      iconOrImage: iconSpecializations[
                          index % iconSpecializations.length],
                    );
                  },
                ),
                buttonSpecializations(
                    context: context,
                    onTap: () {
                      navigateTo(context, MoreSpecializationsScreen());
                    })
              ],
            ),
          );
        }));
  }
}

class SpecializationsItem extends StatelessWidget {
  final dynamic iconOrImage;
  final SpecializationsModel specializationsModel;
  final String nameM;

  final String id;

  const SpecializationsItem({
    Key? key,
    required this.iconOrImage,
    required this.nameM,
    required this.id,
    required this.specializationsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          navigateTo(
              context,
              StatesScreen(
                nameM: nameM,
                idNameM: id,
                title: nameM,
                imageTitle: iconOrImage,
              ));
        },
        child: Container(
          decoration: ShapeDecoration(
            color: ColorManager.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            shadows: [
              BoxShadow(
                color: ColorManager.black2,
                blurRadius: 5,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconOrImage is IconData)
                Icon(
                  iconOrImage,
                  size: 40,
                  color: ColorManager.blueEighth,
                )
              else
                Image.asset(
                  iconOrImage,
                  height: 90,
                  width: 90,
                  // height: 40,
                  // width: 50,
                  fit: BoxFit.fill,
                ),
              SizedBox(
                height: 50,
                child: Text(
                    lang == 'en'
                        ? specializationsModel.name
                        : lang == 'ar'
                            ? specializationsModel.nameArabic
                            : specializationsModel.nameFrance,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        )),
              )
            ],
          ),
        ));
  }
}

List iconSpecializations = [
  'assets/images/01.png',
  'assets/images/03.png',
  'assets/images/08.png',
  'assets/images/09.png',
  'assets/images/10.png',
  'assets/images/11.png',
  'assets/images/12.png',
  'assets/images/13.png',
  'assets/images/17.png',
  'assets/images/18.png',
  'assets/images/21.png',
  'assets/images/22.png',
  'assets/images/23.png',
  'assets/images/24.png',
  'assets/images/25.png',
  'assets/images/027.png',
  'assets/images/28.png',
  'assets/images/30.png',
  'assets/images/32.png',
  'assets/images/34.png',
  'assets/images/35.png',
  'assets/images/36.png',
  'assets/images/37.png',
  'assets/images/38.png',
  'assets/images/39.png',

  Icon_app.wd5,
  Icon_app.dw8,
  Icon_app.we3,
  Icon_app.ventilator,
  Icon_app.simple_logo,
  Icon_app.xs5,
  Icon_app.poison,
  Icon_app.ppe_santizer_alt,
  Icon_app.dw5,
  Icon_app.we3,
  Icon_app.pharmacy,
  Icon_app.social_work,
  Icon_app.biochemistry_laboratory,
  Icon_app.we22,
  Icon_app.observation,
  Icon_app.we6,
  Icon_app.ventilator,
  Icon_app.virus,
  Icon_app.ppe_santizer_alt,
  Icon_app.syringe,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
  Icon_app.werewr,
];
