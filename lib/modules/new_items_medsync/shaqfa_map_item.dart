import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../global/models/body/view_all_doctors_model.dart';

class ShaqfaMapItem extends StatelessWidget {
  final Location location;

  const ShaqfaMapItem({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      polylines: {
        Polyline(
          polylineId: const PolylineId("route"),
          color: const Color(0xFF7B61FF),
          width: 6,
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(location.lng, location.lat),
        // target: LatLng(33.498427,36.3133167),
        zoom: 14,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: {
        Marker(
          markerId: const MarkerId("source"),
          position: LatLng(location.lng, location.lat),
        ),
      },
      onMapCreated: (mapController) {
        // con.controllerMap.complete(mapController);
      },
    );
  }
}
