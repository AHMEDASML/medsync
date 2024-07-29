import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/models/body/specializations_model.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';
import 'package:medsync/modules/doctor/view/screen/specializations_screen.dart';
import 'package:medsync/modules/states/view/states_screen.dart';

class MoreSpecializationsScreen extends StatefulWidget {
  const MoreSpecializationsScreen({Key? key}) : super(key: key);

  @override
  State<MoreSpecializationsScreen> createState() =>
      _MoreSpecializationsScreenState();
}

class _MoreSpecializationsScreenState extends State<MoreSpecializationsScreen> {
  final con = Get.find<DoctorController>();

  final List<String> suggestions = [
    'Cardiology specialties',
    'Mental illness specialties',
    'Internal diseases specialties',
    'Mental illness specialties',
    //... add other strings as required
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '...try searching, browsing',
                prefixIcon: Icon(Icons.search, color: ColorManager.blue2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: con.specializationsModel
                .where((item) => item.icon == false)
                .length,
            itemBuilder: (context, index) {
              // Filter the list for items where 'icon' is false, and then access the index
              final filteredList = con.specializationsModel
                  .where((item) => item.icon == false)
                  .toList();
              return ItemMoreSpecializations(
                  nameM: filteredList[index].name,
                  id: filteredList[index].id,

                  specializationsModel: filteredList[index],
                  iconOrImage: iconSpecializations[con
                      .specializationsModel
                      .indexOf(filteredList[index])],


                  text: filteredList[index].name);
            },
          ),
        ),
      ]),
    );
  }
}

class ItemMoreSpecializations extends StatelessWidget {
  final dynamic iconOrImage;
  final SpecializationsModel specializationsModel;
  final String nameM;
  final String text;
  final String id;

  const ItemMoreSpecializations(
      {Key? key,
      required this.text,
      this.iconOrImage,
      required this.specializationsModel,
      required this.nameM,
      required this.id})
      : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20.0,
                          color: ColorManager.secondBlue,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.secondBlue,
                  ),
                )
              ],
            ),
            Divider(
              height: 10,
              color: ColorManager.firstBlack.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
