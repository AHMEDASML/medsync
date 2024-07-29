import 'package:get/get.dart';
import 'package:medsync/global/localization/locale_controller.dart';
import 'package:medsync/modules/auth/controller/auth_controller.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/laboratories/controller/laboratories_controller.dart';
import 'package:medsync/modules/map/controller/map_controller.dart';
import 'package:medsync/modules/municipalities_state/controller/municipalities_state_controller.dart';
import 'package:medsync/modules/patient_history/controller/patient_history_controller.dart';
import 'package:medsync/modules/profile/controller/profile_controller.dart';
import 'package:medsync/modules/search/search_medicines/controller/search_medicines_controller.dart';
import 'package:medsync/modules/states/controller/states_controller.dart';

class BindingsApp implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LocalController(),fenix: true);

    Get.lazyPut(() => SearchMedicinesController(),fenix: true);
    Get.lazyPut(() => MapController(),fenix: true);
    Get.lazyPut(() => StatesController(),fenix: true);
    Get.lazyPut(() => LaboratoriesController(),fenix: true);
    Get.lazyPut(() => PatientHistoryController(),fenix: true);
    Get.lazyPut(() => AuthController(),fenix: true);
    Get.lazyPut(() => ProfileController(),fenix: true);
    Get.lazyPut(() => MunicipalitiesStateController(),fenix: true);
    Get.lazyPut(() => DoctorController(),fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);

  }
}