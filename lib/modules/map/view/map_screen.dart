import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/map/view/widget/button_google_map.dart';
import 'package:medsync/modules/search/search_medicines/controller/search_medicines_controller.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lot;

  final double desLat;
  final double desLot;

  const MapScreen(
      {Key? key,
      required this.lat,
      required this.lot,
      required this.desLat,
      required this.desLot})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final cont = Get.put(SearchMedicinesController());

  @override
  void initState() {
    cont.getPolyPoints(desLat: widget.desLot, desLong: widget.desLat);

    print('AAASSS  MapScreen');


    // cont.getPolyPoints(desLat: 33.51078292598665, desLong:  36.31763924030879);
    super.initState();
  }

  @override
  void dispose() {
    cont.polylineCoordinates = [];
    cont.polylineCoordinates.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<SearchMedicinesController>(
        init: SearchMedicinesController(),
        builder: (con) => Stack(
          children: [
            GoogleMap(
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: con.polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lot, widget.lat),
                // target: LatLng(33.498427,36.3133167),
                zoom: 14,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId("source"),
                  position: LatLng(widget.lot, widget.lat),
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: LatLng(widget.desLot, widget.desLat),

                  // position: LatLng(-2.2162443,31.6238098),
                ),
              },
              onMapCreated: (mapController) {
                con.controllerMap.complete(mapController);
              },
            ),
            ButtonGoogleMap(onTap: () {
              con.launchMaps(desLat: widget.desLot, desLong: widget.desLat);
            }),
          ],
        ),
      ),
    ));
  }
}
