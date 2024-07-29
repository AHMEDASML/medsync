import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/new_items_medsync/app_bar_item.dart';
import 'package:medsync/modules/new_items_medsync/meds_item_new.dart';

import '../../../../global/models/body/medication_suggestions_model.dart';
import '../../../states/controller/states_controller.dart';
import '../../../states/view/widget/states_item.dart';
import '../../controller/meds_controller.dart';

class MedsScreen extends StatefulWidget {
  const MedsScreen({Key? key}) : super(key: key);

  @override
  State<MedsScreen> createState() => _MedsScreenState();
}

class _MedsScreenState extends State<MedsScreen> {
  late final cont = Get.put(MedsController());

  @override
  void initState() {
    cont.getAllStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MedsController>(
          init: cont,
          builder: (con) {
            return Column(
              children: [
                AppBarItem(
                  text: 'pharmaceutical'.tr,
                  icon: Image.asset(
                    'assets/images/medicine-logo.png',
                    height: 27,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                  onTap: () {},
                  titleName: 'wdwd',
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList.list(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TypeAheadFormField<MedicationSuggestion>(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: con.controller,
                                decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  hintText: 'Find the medicine'.tr,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: ColorManager.gray5,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                  prefixIcon: Icon(Icons.ac_unit,
                                      color: ColorManager.fourthHeavenly),
                                ),
                              ),
                              suggestionsCallback: (pattern) =>
                                  con.getSuggestion(pattern),
                              itemBuilder: (context, suggestion) => ListTile(
                                title: Text(suggestion.brandName),
                              ),
                              itemSeparatorBuilder: (context, index) =>
                                  const Divider(),
                              onSuggestionSelected: (suggestion) {
                                con.controller.text = suggestion.brandName;
                                con.selectSuggestion(suggestion);
                              },
                            ),
                          ),
                          if (con.loadingState)
                            const Center(
                              child: CircularProgressIndicator(),
                            )
                          else if (con.stateError != null)
                            Center(
                              child: Text(con.munError.toString()),
                            )
                          else
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButton(
                                      value: con.idState,
                                      items: List.generate(con.statesModel.length,
                                          (index) {
                                        return DropdownMenuItem(
                                          value: con.statesModel[index],
                                          child: Text(
                                            con.statesModel[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: ColorManager.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        con.selectStatesModel(value);
                                      },

                                      iconSize: 28.0,
                                      elevation: 16,
                                      dropdownColor: Colors.white,
                                    ),
                                  ),
                                ),
                                if (con.loadingMun)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                else if (con.munError != null)
                                  Center(
                                    child: Text(con.munError.toString()),
                                  )
                                else






                                  Container(

                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),

                                    child: DropdownButton(

                                      value: con.municipalitieModel,
                                      items: List.generate(
                                          con.municipalitiesModel.first.data
                                              .length, (index) {
                                        return DropdownMenuItem(
                                          value: con.municipalitiesModel.first
                                              .data[index],
                                          child: Text(
                                            con.municipalitiesModel.first
                                                .data[index].name,
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        con.selectMunicipalitie(value);
                                      },


                                      iconSize: 28.0,
                                      elevation: 16,
                                      dropdownColor: Colors.white,
                                    ),
                                  ),

                              ],
                            )
                          // TextField(
                          //   controller: con.controller,
                          // ),
                        ],
                      ),
                      if (con.loadingMun || con.loadingState || con.loadingMeds)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (con.medsError != null)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(con.medsError.toString()),
                          ),
                        )
                      else ...[
                        for (var model in con.doctors)
                          SliverList.builder(
                            itemCount: model.pharmacist.length,
                            itemBuilder: (context, index) {
                              return MedsItemNew(
                                pharmacist: model.pharmacist[index],
                                side: con
                                    .municipalitiesModel.first.data[index].name,
                                state: con.statesModel[index].name,
                              );
                              // Text(model.pharmacist[index].name);
                              //
                            },
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
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
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: widget.isSelected ? Colors.red : const Color(0xFF74C053),
              ),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: Center(
            child: Text(
              widget.nameMedicament,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorManager.gray2,
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
