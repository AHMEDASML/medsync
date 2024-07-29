import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/medication_suggestions_model.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class SearchMedicinesController extends GetxController {

  final search = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<SearchPharmaciesModels>? searchPharmaciesModels;
  MedicationSuggestionsModel? medicationSuggestionsModel;
  bool isSwitched = false;
  var token = CacheHelper.getData(key: TOKEN);

  // List<dynamic> resultListMedicines = [];
  bool waiting = false;
  bool waitingPharmacies = false;
  final Completer<GoogleMapController> controllerMap = Completer();

  List<LatLng> polylineCoordinates = [];





  @override
  void onInit() {
    getUserCurrentLocation();
    search.addListener(() {
      onChange();
    });

    super.onInit();
  }

  void onChange() {
    if (searchFocusNode.hasFocus) {
      // getSuggestion(input: search.text);
      getSuggestion(input: 'g');
    }
  }

// Suggestio
  void getSuggestion({required String input}) async {
    try {
      var response = await DioHelper.getData(
          // url: '$BASE_URL$SERCH_MEDICINE$input',
          url: '$BASE_URL/api/pharmacists/pharmacist-complete-name',
          token: token,
          query: {'name_medicine': input});
      if (response.statusCode == 200) {
        print(response.data.toString());
        medicationSuggestionsModel =
            MedicationSuggestionsModel.fromJson(response.data);

        medicationSuggestionsModel!.data.isNotEmpty ? waiting = true : false;
        update();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  double calculateDistance(
      double startLat, double startLon, double endLat, double endLon) {
    const double EARTH_RADIUS = 6371e3; // Earth radius in meters

    // Convert latitude and longitude from degrees to radians
    double startLatInRadians = startLat * pi / 180;
    double endLatInRadians = endLat * pi / 180;
    double differenceInLatitude = (endLat - startLat) * pi / 180;
    double differenceInLongitude = (endLon - startLon) * pi / 180;
    // Calculate the Haversine distance
    double haversineDistance =
        sin(differenceInLatitude / 2) * sin(differenceInLatitude / 2) +
            cos(startLatInRadians) *
                cos(endLatInRadians) *
                sin(differenceInLongitude / 2) *
                sin(differenceInLongitude / 2);
    double angularDistance =
        2 * atan2(sqrt(haversineDistance), sqrt(1 - haversineDistance));
    // Convert the angular distance to actual distance in meters
    double distanceInMeters = EARTH_RADIUS * angularDistance;

    return distanceInMeters;
  }

  Future<void> getPharmacy(
      {required String medicamentName,
      required String municipality,
      required String state}) async {
    Map<String, dynamic>? query = {
      'brand_name': 'glucar',
      'municipality': '6502c28c1c41728f6b974ae3',
      'state': '6502c03a518f32014fba79e8'
    };
    try {
      var response = await DioHelper.getData(
        url:
            '$BASE_URL/api/pharmacists/pharmacist-medicine-search?brand_name=$medicamentName&municipality=$municipality&state=$state',
        token: token,
        // query: query
      );

      if (response.statusCode == 200) {
        print('ASS11111ddd1111');
        searchPharmaciesModels = (response.data as List)
            .map((item) => SearchPharmaciesModels.fromJson(item))
            .toList();
        print('ASDFDDSSAAA2232323AA');
        print(searchPharmaciesModels![0].pharmacist.first.name);

        // if (isSwitched) {
        //   searchPharmaciesModels!.data.first.pharmacist.sort((a, b) =>
        //       calculateDistance(
        //               latitude, longitude, a.location.lat, a.location.lng)
        //           .compareTo(calculateDistance(
        //               latitude, longitude, b.location.lat, b.location.lng)));
        // } else {
        //   searchPharmaciesModels =
        //       SearchPharmaciesModels.fromJson(response.data);
        // }
        waitingPharmacies = true;
        update();
      } else {
        print(response.statusMessage);
        waitingPharmacies = true;
        update();
      }
    } catch (e) {
      print(e);
      waitingPharmacies = false;
      update();
    }
  }


  Future<Position> getUserCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission permanently denied');
      } else if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      } else {
        final value = await Geolocator.getCurrentPosition();
        print(value.latitude);
        print(value.longitude);

        latitude = value.latitude;
        longitude = value.longitude;

        update();
        return await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      throw Exception('Error getting current position: $e');
    }
  }

  void getPolyPoints({required double desLat, required double desLong}) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBTlSamMjj1vDJw1qnCtA8swbnbuoyXPos',
      PointLatLng(latitude, longitude),
      PointLatLng(desLat, desLong),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      update();
    }
  }

  launchMaps({required double desLat, required double desLong}) async {
    String url =
        'https://www.google.com/maps/dir/?api=1&origin=$latitude,$longitude&destination=$desLat,$desLong&travelmode=driving&dir_action=navigate';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
