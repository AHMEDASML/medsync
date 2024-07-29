import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_arithmetic_app.dart';
import 'package:medsync/global/models/body/farmasy_model.dart';
import 'package:medsync/global/models/body/view_all_doctors_model.dart';

import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/book_appointment_screen.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/map/view/map_screen.dart';
import 'package:medsync/modules/new_items_medsync/shaqfa_map_item.dart';

class ViewFarmaDetails extends StatefulWidget {
  final FarmasyModel farmasyModel;

  const ViewFarmaDetails({
    Key? key,
    required this.farmasyModel,
  }) : super(key: key);

  @override
  State<ViewFarmaDetails> createState() => _ViewFarmaDetailsState();
}

class _ViewFarmaDetailsState extends State<ViewFarmaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarRowArithmeticApp(
              titleName: widget.farmasyModel.name,
              text: '',
              icon: Row(
                children: [
                  Image.asset(
                    'assets/images/fishing-logo.png',
                    height: 28,
                    width: 31,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Pharmacies".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            Column(children: [
              // Text(widget.farmasyModel.specialization.name,
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleSmall!
              //         .copyWith(
              //       color: const Color(0xFF585858),
              //       fontSize: 24,
              //       fontWeight: FontWeight.w400,
              //       height: 0.07,
              //     )),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("number".tr,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color(0xFF2CA6FF),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            )),
                    Text(widget.farmasyModel.phone.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color(0xFF585858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            )),
                    allIconDoctor(onTapMap: () {
                      navigateTo(
                          context,
                          MapScreen(
                            lat: longitude,
                            lot: latitude,
                            desLat: widget.farmasyModel.location.lng,
                            desLot: widget.farmasyModel.location.lat,

                            // desLat: 33.4914479,
                            // desLot: 36.3133119,
                          ));
                    }),
                    Text("Location".tr,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color(0xFF2CA6FF),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                          "District 1600, Residence, Building No. 112, Number One, Mail Article"
                              .tr,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.firstBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 200,
                width: 400,
                child: GoogleMap(
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      color: const Color(0xFF7B61FF),
                      width: 6,
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.farmasyModel.location.lng,
                        widget.farmasyModel.location.lat),
                    // target: LatLng(33.498427,36.3133167),
                    zoom: 14,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: {
                    Marker(
                      markerId: const MarkerId("source"),
                      position: LatLng(widget.farmasyModel.location.lng,
                          widget.farmasyModel.location.lat),
                    ),
                  },
                  onMapCreated: (mapController) {
                    // con.controllerMap.complete(mapController);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonBooking extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ButtonBooking({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: ColorManager.secondBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: ColorManager.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
