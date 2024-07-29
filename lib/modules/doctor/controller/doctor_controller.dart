import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/show_toast_app.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/all_numbers_flagas_model.dart';
import 'package:medsync/global/models/body/specializations_model.dart';
import 'package:medsync/global/models/body/view_all_doctors_model.dart';
import 'package:medsync/global/models/response/next_number_dr_model.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/modules/layout/view/layout_screen.dart';

class DoctorController extends GetxController {
  bool loading = false;
  List<ViewAllDoctorsModel> viewAllDoctorsModel = [];
  late List<SpecializationsModel> specializationsModel=[];
  late List<AllNumbersFlagModel> allNumbersFlagModel = [];
  NextNumberDrModel? nextNumberDrModel;

  // int nextNumberDrModel=0;

  var token = CacheHelper.getData(key: TOKEN);

  @override
  void onInit() {
    getAllSpecializations();
    super.onInit();
  }

  Future<void> getAllSpecializations() async {
    try {
      var response = await DioHelper.getData(
          url: '$BASE_URL/api/doctors/get-specialization');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        specializationsModel =
            data.map((item) => SpecializationsModel.fromJson(item)).toList();
        print(specializationsModel.length);
        print(specializationsModel.first.id);
        loading = true;
        update();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> getViewAllDoctors({
    String? specialization,
    String? municipality,
    String? state,
    String? name,
  }) async {
    try {
      var response = await DioHelper.getData(
        url:
            // '$BASE_URL/doctors/serach-for-doctor?name=$name&specialization=65182ca0f5a1e4395bf976e1&municipality=$municipality&state=$state',
            '$BASE_URL/doctors/serach-for-doctor?name=$name&specialization=$specialization&municipality=$municipality&state=$state',



            // '$BASE_URL/api/doctors/serach-for-doctor?specialization=$specialization&municipality=$municipality&state=$state',
        // '$BASE_URL/api/doctors/serach-for-doctor?specialization=650217fd629522c111df8539&municipality=6502c34438773058bf38fe10&state=6502c03a518f32014fba79e8',
        token: token,
        // query: query
      );
      if (response.statusCode == 200) {
        print('ddwdwd');
        List<dynamic> data = response.data;
        viewAllDoctorsModel =
            data.map((item) => ViewAllDoctorsModel.fromJson(item)).toList();
        loading = true;
        update();
      } else {
        print('ddwdeeeeewd');
        print(response.statusMessage);
        loading = true;
        update();
      }
    } catch (e) {
      print(e);
      loading = false;
      update();
    }
  }

  Future<void> bookExaminationDoctor(
      {required BuildContext context,
      required String doctorId,
      required int bookedNumber}) async {
    final data = {
      // 'phone': phone.text.trim(),
      // 'password': password.text.trim(),

      "doctorId": doctorId,
      "bookedNumber": bookedNumber
    };
    try {
      var response = await DioHelper.postData(
          url: '$BASE_URL$bookExaminationBASE', data: data, token: token);

      if (response.statusCode == 200 || response.statusCode == 201) {
        showToastApp(
            text: json.encode(response.data['message']),
            color: ColorManager.green);
        CacheHelper.saveData(key: LASTNUMBERDOCTOR, value: doctorId);
        CacheHelper.saveData(key: BookedNUMBER, value: bookedNumber);
        navigateAndFinish(context, LayoutScreen());
      } else {
        print(response.statusMessage);
        showToastApp(
            text: json.encode(response.data['message']),
            color: ColorManager.firstRed);
      }
    } catch (e) {
      showToastApp(text: 'Number already booked', color: ColorManager.firstRed);
      print(e.toString());
    }
  }

  Future<void> getAllNumbersFlag({required String doctorId}) async {
    try {

      var response = await DioHelper.getData(
          url:
              '$BASE_URL/api/doctors/getAllExaminationNumbersWithFlag/$doctorId',
          token: token);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        allNumbersFlagModel =
            data.map((item) => AllNumbersFlagModel.fromJson(item)).toList();
        print(allNumbersFlagModel.length);

        loading = true;
        update();
      } else {
        nextNumberDrModel = null;
        print(response.statusMessage);
        update();
      }
    } catch (e) {
      nextNumberDrModel = null;

      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> getNextNumberDr({required String id}) async {

    try {
      loading=false;
      update();
      var idDr = await CacheHelper.getData(key: LASTNUMBERDOCTOR);
      var response = await DioHelper.getData(
          url: '$BASE_URL/api/doctors/get-next-number/$id',token: token);
          // url: '$BASE_URL/api/doctors/get-next-number/6502c7ca118e805b7f8a15fe',
          // token: token);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        nextNumberDrModel = NextNumberDrModel.fromJson(response.data);
        print('WFEWFEWFWEF');
        print(nextNumberDrModel!.nextNumber.toString());
        // nextNumberDrModel=nextNumber;
        loading = true;
        update();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }


  @override
  void dispose() {
    loading = false;
    viewAllDoctorsModel.clear();
    specializationsModel.clear();
    allNumbersFlagModel.clear();
    nextNumberDrModel = null;
    super.dispose();
  }

  @override
  void onClose() {
    loading = false;
    viewAllDoctorsModel.clear();
    specializationsModel.clear();
    allNumbersFlagModel.clear();
    nextNumberDrModel = null;
    super.dispose();

  }


}
