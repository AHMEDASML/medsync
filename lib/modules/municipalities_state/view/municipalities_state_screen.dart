import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/show_doctors_items_screen.dart';
import 'package:medsync/modules/laboratories/view/screen/laboratories_screen.dart';
import 'package:medsync/modules/municipalities_state/controller/municipalities_state_controller.dart';
import 'package:medsync/modules/new_items_medsync/doctor_item_new.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/view_pharmacies.dart';
import 'package:medsync/modules/states/view/widget/states_item.dart';

class MunicipalitiesStateScreen extends StatefulWidget {
  final String idState;
  final String nameM;
  final String? idNameM;

  const MunicipalitiesStateScreen(
      {Key? key, required this.idState, required this.nameM, this.idNameM})
      : super(key: key);

  @override
  State<MunicipalitiesStateScreen> createState() =>
      _MunicipalitiesStateScreenState();
}

class _MunicipalitiesStateScreenState extends State<MunicipalitiesStateScreen> {
  late final cont = Get.put(MunicipalitiesStateController());

  @override
  void initState() {
    cont.fill(
      idState: widget.idState,
      idNameM: widget.idNameM,
    );
    cont.getMunicipalities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<MunicipalitiesStateController>(
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

          // return ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   itemCount: con.municipalitiesModel.first.data.length,
          //   itemBuilder: (context, index) {
          //     return StatesItem(
          //       idMunicipalities: con.municipalitiesModel.first.data[index].id,
          //       id: con.municipalitiesModel.first.data[index].state,
          //       nameMedicament: con.municipalitiesModel.first.data[index].name,
          //       nameM:  widget.nameM, idNameM:  widget.idNameM ?? '',
          //     );
          //   },
          // );

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList.list(
                  children: [

                      AppBarRowImageApp(text: 'Doctor'.tr,imageUrl: 'assets/images/doctor11.png',),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.nameM,
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
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: con.municipalitiesModel.first.data.length,
                        itemBuilder: (context, index) {
                          return MunicipalitiesItemSelect(
                            idMunicipalities:
                                con.municipalitiesModel.first.data[index].id,
                            id: con.municipalitiesModel.first.data[index].state,
                            nameMedicament:
                                con.municipalitiesModel.first.data[index].name,
                            nameM: widget.nameM,
                            idNameM: widget.idNameM ?? '',
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
                    SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Container(
                        width: 100.0,
                        // Adjust the width to your desired square size
                        height: 60.0,
                        // Adjust the height to your desired square size
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ColorManager.black.withOpacity(0.3),
                          ),
                        ),
                        child: Center(
                          child: TextField(
                            controller: con.controller,
                            // textAlign: TextAlign.center,
                            decoration:   InputDecoration(
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.search_rounded),
                              ),
                              border: InputBorder.none,
                              hintText: 'Search'.tr,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      // child: Text(con.doctorsError.toString()),
                      child: Text('There are no doctors'),
                    ),
                  )
                else
                  SliverList.builder(
                    itemCount: con.doctors.length,
                    itemBuilder: (context, index) {


                      return  DoctorItemNew(
                        state: widget.nameM,
                        side: con.municipalitiesModel.first.data[0].name,
                        viewAllDoctorsModel: con.doctors[index],);
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

class MunicipalitiesItemSelect extends StatefulWidget {
  final String id;
  final String nameMedicament;
  final String? idMunicipalities;
  final String nameM;
  final String? idNameM;
  final bool isSelected;
  final VoidCallback onTap;

  const MunicipalitiesItemSelect({
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
  _MunicipalitiesItemSelectState createState() =>
      _MunicipalitiesItemSelectState();
}

class _MunicipalitiesItemSelectState extends State<MunicipalitiesItemSelect> {
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
