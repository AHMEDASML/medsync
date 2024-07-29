import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/components/serch_app.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/search/search_medicines/controller/search_medicines_controller.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/search_medicines_screen.dart';
import 'package:medsync/modules/search/search_medicines/view/widget/search_item.dart';

class ViewPharmacies extends StatefulWidget {
  final String nameMedicament;
  final String state;
  final String municipality;
  final String nameM;

  const ViewPharmacies(
      {Key? key,
      required this.nameMedicament,
      required this.state,
      required this.municipality,
      required this.nameM})
      : super(key: key);

  @override
  State<ViewPharmacies> createState() => _ViewPharmaciesState();
}

class _ViewPharmaciesState extends State<ViewPharmacies> {
  final cont = Get.find<SearchMedicinesController>();
  List<Pharmacist> sortedPharmacists = [];

  String nameMedicament = "";
  String state = "";
  String municipality = "";

  Future<void> test() async {
    setState(() {
      state = widget.state;
      nameMedicament = widget.nameMedicament;
      municipality = widget.municipality;
    });

    print('ASSSSDDDDFFFF');
    print(widget.nameMedicament);

    await cont.getPharmacy(
        medicamentName: widget.nameM,
        municipality: widget.municipality,
        state: widget.state);
  }

  @override
  void initState() {
    Map<String, dynamic>? query = {
      'brand_name': 'glucar',
      'municipality': '6502c28c1c41728f6b974ae3',
      'state': '6502c03a518f32014fba79e8'
    };
    test();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context: context, text: 'View Pharmacies'),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<SearchMedicinesController>(
                builder: (con) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Pharmacies that have the medicine available',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            'Nearby pharmacies',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),

                      ],
                    ),
                    con.waitingPharmacies
                        ? Expanded(
                            child: Container(
                              color: Colors.white10,
                              child: ListView.builder(
                                itemCount: con.searchPharmaciesModels!.first
                                    .pharmacist.length,
                                itemBuilder: (context, index) {
                                  return SearchItem(
                                    pharmacist: con.searchPharmaciesModels!
                                        .first.pharmacist[index],
                                    lat: latitude,
                                    lng: longitude,
                                    onTap: () {
                                      con.getPolyPoints(
                                          desLat: con
                                              .searchPharmaciesModels!
                                              .first
                                              .pharmacist[index]
                                              .location
                                              .lat,
                                          desLong: con
                                              .searchPharmaciesModels!
                                              .first
                                              .pharmacist[index]
                                              .location
                                              .lng);
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        : loadingAppWidget(),
                  ],
                ),
              ))),
    );
  }
}
