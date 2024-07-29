import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/show_toast_app.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/create_users_model.dart';
import 'package:medsync/global/models/body/login_model.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/modules/layout/view/layout_screen.dart';
import 'package:medsync/modules/otp_verification/view/screen/otp_verification_screen.dart';

class AuthController extends GetxController {
  bool loading = false;
  LoginModel? loginModel;
  CreateUsersModel? createUsersModel;

  //
  String zIPCode = '+231';

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  String selectedGender = 'Male';

  TextEditingController phoneLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void setLoading(bool status) {
    loading = status;
    update();
  }

  Future<void> registration(
      {required BuildContext context, required String gender}) async {
    setLoading(true);

    final data = json.encode({
      'first_name': firstName.text,
      'last_name': lastName.text,
      'phone': "$zIPCode${phone.text}",
      'password': password.text,
      'email': email.text,
      "age": age.text,
      "gender": gender
    });

    try {
      var response =
          await DioHelper.postData(url: '$BASE_URL$CREATE_USER', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String? token = response.headers.value('X-Auth-Token');
        CacheHelper.saveData(key: TOKEN, value: token);
        createUsersModel = CreateUsersModel.fromJson(response.data);
        await CacheHelper.saveData(
            key: NAMEUSER, value: createUsersModel!.data.firstName);
        await CacheHelper.saveData(
            key: NUMBERUSER, value: createUsersModel!.data.phone);

        setLoading(false);

        navigateAndFinish(context, OTPVerificationScreen());
      } else {
        setLoading(false);
      }
    } catch (e) {
      showToastApp(text: 'Try again', color: ColorManager.firstRed);
      print(e.toString());
      setLoading(false);
    }
  }

  Future<void> login(context) async {
    setLoading(true);

    final data = json.encode({
      'phone': phoneLogin.text.toString(),
      'password': passwordLogin.text,
    });

    try {
      var response =
          await DioHelper.postData(url: '$BASE_URL/api/auth-user', data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = LoginModel.fromJson(response.data);

        await CacheHelper.saveData(key: TOKEN, value: loginModel!.token);
        await CacheHelper.saveData(key: NAMEUSER, value: loginModel!.firstName);

        await CacheHelper.saveData(key: GENDER, value: loginModel!.gender);
        await CacheHelper.saveData(key: AGE, value: loginModel!.age);
        await CacheHelper.saveData(key: EMAIL, value: loginModel!.email);

        await CacheHelper.saveData(key: NUMBERUSER, value: loginModel!.phone);

        setLoading(false);
        navigateAndFinish(context, LayoutScreen());
      } else {
        print(response.statusMessage);
        print('EEEEEEEEEEEEEEEEEEEE');
        setLoading(false);
      }
    } catch (e) {
      showToastApp(
          text: 'The password and number are incorrect',
          color: ColorManager.firstRed);

      print(e.toString());
      setLoading(false);
    }
  }

  var inputType = TextInputType.text;

  changval(bool val) {
    inputType = val ? TextInputType.visiblePassword : TextInputType.text;
    update();
  }
}
