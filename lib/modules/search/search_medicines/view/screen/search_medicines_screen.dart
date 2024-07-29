import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/components/icon_app_screen.dart';
import 'package:medsync/global/components/serch_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/map/view/map_screen.dart';
import 'package:medsync/modules/search/search_medicines/view/widget/medicines_item.dart';
import 'package:medsync/modules/search/search_medicines/controller/search_medicines_controller.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/view_pharmacies.dart';
import 'package:medsync/modules/states/view/states_screen.dart';

class SearchMedicinesScreen extends StatefulWidget {
  const SearchMedicinesScreen({Key? key}) : super(key: key);

  @override
  State<SearchMedicinesScreen> createState() => _SearchMedicinesScreenState();
}

class _SearchMedicinesScreenState extends State<SearchMedicinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context: context, text: 'Medicines'),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<SearchMedicinesController>(
                builder: (con) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchApp(
                        focusNode: con.searchFocusNode,
                        controller: con.search,
                        onChanged: (val) {
                          con.search.text = val;
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Choose a drug name from the suggested names'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    con.waiting
                        ? Expanded(
                            child: Container(
                              color: Colors.white10,
                              child: ListView.builder(
                                itemCount:
                                    con.medicationSuggestionsModel!.data.length,
                                itemBuilder: (context, index) {
                                  return MedicinesItem(
                                    text: con.medicationSuggestionsModel!
                                        .data[index].brandName,
                                    onTap: () {

                                      navigateTo(context,StatesScreen(nameM: con.medicationSuggestionsModel!
                                          .data[index].brandName,));

                                      // navigateTo(
                                      //     context,
                                      //     ViewPharmacies(
                                      //       nameMedicament: con
                                      //           .medicationSuggestionsModel!
                                      //           .data[index]
                                      //           .brandName,
                                      //     ));
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                    : con.search.text.isEmpty ? loadingAppWidget() :

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Center(
                        child: Text(
                          'There are no medications.'.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ] ,
                ) ,
              ))) ,
    );
  }
}

// con.searchModels!.data[0].pharmacist[index].name
