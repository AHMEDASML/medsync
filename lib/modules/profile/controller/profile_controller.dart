import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/show_toast_app.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/profile_models.dart';
import 'package:medsync/global/utils/key_shared.dart';

class ProfileController extends GetxController {
  bool loading = false;
  bool loadingResponse = false;
  final token = CacheHelper.getData(key: TOKEN);
  String selectedGender = 'Male';

  ProfileModel? profileModel;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();

  final allergies = TextEditingController();
  final medicalHistory = TextEditingController();
  final age = TextEditingController();
  final currentMedications = TextEditingController();

  String? newEmail;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      var response =
          await DioHelper.getData(url: '$BASE_URL$GetProfile', token: token);
      if (response.statusCode == 200) {
        print('AAAAAAAAAAAA');
        profileModel = ProfileModel.fromJson(response.data);
        firstName.text = profileModel!.data.firstName;
        lastName.text = profileModel!.data.lastName;
        email.text = profileModel!.data.email;
        age.text = profileModel!.data.age.toString();
        selectedGender = profileModel!.data.gender;
        allergies.text = profileModel!.data.allergies;
        medicalHistory.text = profileModel!.data.medicalHistory;
        currentMedications.text = profileModel!.data.currentMedications;
        newEmail = profileModel!.data.email;
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

  Future<void> editeProfile() async {
    loadingResponse = true;
    update();
    try {
      Map<String, dynamic> data = {
        "first_name": firstName.text,
        "last_name": lastName.text,
        "medical_history": medicalHistory.text,
        "allergies": allergies.text,
        "current_medications": currentMedications.text,
        "age": int.tryParse(age.text) ?? 0,
        "gender": selectedGender
      };

      if (newEmail != email.text) {
        data["email"] = email.text;
      }

      var response = await DioHelper.putData(
          url: '$BASE_URL$GetProfile', data: data, token: token);
      // url: '$BASE_URL$GetProfile', data: data, token: token);

      if (response.statusCode == 200) {
        getProfile();
        showToastApp(text: 'The account has been modified successfully');
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error occurred: ${e.toString()}');
    } finally {
      loadingResponse = false;
      update();
    }
  }
}
