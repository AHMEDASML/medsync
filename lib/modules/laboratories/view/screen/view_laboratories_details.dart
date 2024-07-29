import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsync/global/Common/functions_app.dart';

import 'package:medsync/global/components/app_bar_new/app_bar_row_arithmetic_app.dart';
import 'package:medsync/global/models/body/laboratories_model.dart';

import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/map/view/map_screen.dart';

class ViewLaboratoriesDetails extends StatefulWidget {
  final LaboratoriesModel laboratoriesModel;

  const ViewLaboratoriesDetails({
    Key? key,
    required this.laboratoriesModel,
  }) : super(key: key);

  @override
  State<ViewLaboratoriesDetails> createState() =>
      _ViewLaboratoriesDetailsState();
}

class _ViewLaboratoriesDetailsState extends State<ViewLaboratoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarRowArithmeticApp(
              titleName: widget.laboratoriesModel.name,
              text: '',
              icon: Icon(Icons.edit, color: ColorManager.white, size: 26),
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
                    Text(widget.laboratoriesModel.phone.toString(),
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
                            desLat: widget.laboratoriesModel.location.lng,
                            desLot: widget.laboratoriesModel.location.lat,
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
                    target: LatLng(widget.laboratoriesModel.location.lng,
                        widget.laboratoriesModel.location.lat),
                    // target: LatLng(33.498427,36.3133167),
                    zoom: 14,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: {
                    Marker(
                      markerId: const MarkerId("source"),
                      position: LatLng(widget.laboratoriesModel.location.lng,
                          widget.laboratoriesModel.location.lat),
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
