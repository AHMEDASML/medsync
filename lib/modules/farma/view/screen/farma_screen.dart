import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/new_items_medsync/farma_item_new.dart';

import '../../controller/farma_controller.dart';

class FarmaScreen extends StatefulWidget {
  final String idState;

  const FarmaScreen({Key? key, required this.idState}) : super(key: key);

  @override
  State<FarmaScreen> createState() => _FarmaScreenState();
}

class _FarmaScreenState extends State<FarmaScreen> {
  late final cont = Get.put(FarmaController());

  @override
  void initState() {
    cont.fill(
      idState: widget.idState,
    );
    cont.getMunicipalities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FarmaController>(
        init: cont,
        builder: (con) {
          if (!con.loading) {
            return loadingAppWidget();
          }

          if (con.municipalitiesModel.isEmpty) {
            return Center(
              child: Text('No municipalities data available.'.tr),
            );
          }

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList.list(
                  children: [
                    AppBarRowImageApp(
                      text: 'Pharmacies'.tr,
                      imageUrl: 'assets/images/home2.png',
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Near me".tr,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorManager.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.map,
                            size: 22,
                            color: ColorManager.blueGrey2,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: con.municipalitiesModel.first.data.length,
                        itemBuilder: (context, index) {
                          return LaboratoriesItemSelect(
                            idMunicipalities:
                                con.municipalitiesModel.first.data[index].id,
                            id: con.municipalitiesModel.first.data[index].state,
                            nameMedicament:
                                con.municipalitiesModel.first.data[index].name,
                            nameM: "widget.nameM",
                            idNameM: "widget.idNameM",
                            isSelected: con.municipalitieModel ==
                                con.municipalitiesModel.first.data[index],
                            onTap: () {
                              setState(() {
                                con.select(
                                    con.municipalitiesModel.first.data[index]);
                              });
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // TextField(
                    //   controller: con.controller,
                    // ),
                  ],
                ),
                if (con.loadingDoctors)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (con.doctorsError != null)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      // child: Text(con.doctorsError.toString()),
                      child: Text('There are no pharmacies'.tr),
                    ),
                  )
                else
                  SliverList.builder(
                    itemCount: con.doctors.length,
                    itemBuilder: (context, index) {
                      return FarmaItemNew(
                        state: 'pharmacy',
                        side: con.municipalitiesModel.first.data[index].name,
                        farmasyModel: con.doctors[index],
                      );

                      // return Text(con.doctors[index].name);
                    },
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

class LaboratoriesItemSelect extends StatefulWidget {
  final String id;
  final String nameMedicament;
  final String? idMunicipalities;
  final String nameM;
  final String? idNameM;
  final bool isSelected;
  final VoidCallback onTap;

  const LaboratoriesItemSelect({
    Key? key,
    required this.id,
    required this.nameMedicament,
    this.idMunicipalities,
    required this.nameM,
    this.idNameM,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _LaboratoriesItemSelectState createState() => _LaboratoriesItemSelectState();
}

class _LaboratoriesItemSelectState extends State<LaboratoriesItemSelect> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Container(
          width: 91.54,
          height: 30,
          decoration: ShapeDecoration(
            color: widget.isSelected ? ColorManager.green : ColorManager.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF74C053),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              widget.nameMedicament,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: widget.isSelected
                        ? ColorManager.white
                        : ColorManager.gray2,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medsync/global/Common/loading_app.dart';
// import 'package:medsync/global/components/appbar_new_app.dart';
// import 'package:medsync/global/components/icon_app_screen.dart';
// import 'package:medsync/global/components/title_app_bold.dart';
// import 'package:medsync/global/models/body/laboratories_model.dart';
// import 'package:medsync/global/utils/color_app.dart';
// import 'package:medsync/modules/laboratories/controller/meds_controller.dart';
//
// class LaboratoriesScreen extends StatefulWidget {
//   final String state;
//   final String municipality;
//
//   const LaboratoriesScreen(
//       {Key? key, required this.state, required this.municipality})
//       : super(key: key);
//
//   @override
//   State<LaboratoriesScreen> createState() => _LaboratoriesScreenState();
// }
//
// class _LaboratoriesScreenState extends State<LaboratoriesScreen> {
//   final cont = Get.put(LaboratoriesController());
//
//   @override
//   void initState() {
//
//     print('AAAASSSSDDDCCCCCC');
//     print(widget.state);
//     print(widget.municipality);
//     cont.getAllLaboratories(state: widget.state,municipality: widget.municipality);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: appbarNewApp(context: context, textTitle: 'Laboratories'.tr),
//         body: GetBuilder<LaboratoriesController>(
//           builder: (con) {
//             if (!con.loading) {
//               return loadingAppWidget();
//             }
//
//             return ListView.builder(
//               // scrollDirection: Axis.horizontal,
//               itemCount: con.laboratoriesModel.length, // number of cards
//               itemBuilder: (context, index) {
//                 return LaboratoriesItem(
//                   onTap: () {},
//                   laboratoriesModel: con.laboratoriesModel[index],
//                 );
//               },
//             );
//           },
//         ));
//   }
// }
//
// class LaboratoriesItem extends StatelessWidget {
//   final LaboratoriesModel laboratoriesModel;
//   final Function onTap;
//
//   const LaboratoriesItem(
//       {Key? key, required this.laboratoriesModel, required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//             color: ColorManager.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 3,
//                 offset: const Offset(0, 3),
//               ),
//             ]),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               TitleAppBold(
//                 text: laboratoriesModel.name,
//                 theme: Theme.of(context).textTheme.bodyLarge,
//               ),
//
//               TitleAppBold(
//                 text: "Lab Name : ${laboratoriesModel.labName}",
//                 theme: Theme.of(context).textTheme.bodyLarge,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TitleAppBold(
//                     text: "Number : ${laboratoriesModel.phone}",
//                     theme: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   IconAppScreen(
//                     onTap: () {
//                       onTap();
//                     },
//                     icon: Icons.map,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
