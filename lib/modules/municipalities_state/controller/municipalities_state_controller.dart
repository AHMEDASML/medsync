import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/municipalities_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

import '../../../global/models/body/view_all_doctors_model.dart';

class MunicipalitiesStateController extends GetxController {
  String? idState;
  String? idNameM;

  bool loading = false;
  bool loadingDoctors = true;
  dynamic doctorsError;

  final token = CacheHelper.getData(key: TOKEN);

  String _prev = "";
  TextEditingController controller = TextEditingController();

  MunicipalitieModel? municipalitieModel;
  late List<MunicipalitiesModel> municipalitiesModel;
  late List<ViewAllDoctorsModel> doctors;


  fill({required String? idState, required String? idNameM}) {
    this.idState = idState;
    this.idNameM = idNameM;
  }

  @override
  void onInit() {
    controller.addListener(() {
      if (_prev != controller.text.trim()) {
        _prev = controller.text.trim();
        getViewAllDoctors(
          state: idState,
          municipality: municipalitieModel!.id,
          specialization: idNameM,
        );
      }
    });
    super.onInit();
  }

  void select(MunicipalitieModel? municipalitieModel) {
    this.municipalitieModel = municipalitieModel;
    update();
    getViewAllDoctors(
      state: idState,
      municipality: municipalitieModel!.id,
      specialization: idNameM,
    );
  }

  Future<void> getMunicipalities() async {
    try {
      var response = await DioHelper.getData(
          url: '$BASE_URL/api/admins/municipalities-by-state/$idState');

      if (response.statusCode == 200) {
        print(response.data);
        municipalitiesModel = [MunicipalitiesModel.fromJson(response.data)];
        municipalitieModel = municipalitiesModel.first.data.first;
        loading = true;
        update();
        getViewAllDoctors(
          state: idState,
          municipality: municipalitieModel!.id,
          specialization: idNameM,
        );
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> getViewAllDoctors(
      {String? specialization, String? municipality, String? state}) async {
    try {
      loadingDoctors = true;
      doctorsError = null;


      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(specialization);
      print(municipality);
      print(state);
      var response = await DioHelper.getData(
        url: '$BASE_URL/api/doctors/serach-for-doctor',
        query: {
          "specialization": specialization,
          "municipality": municipality,
          "state": state,
          "name": controller.text.trim(),
        },

        // query: {
        //   "specialization": '650217fd629522c111df8539',
        //   "municipality": '6502c34438773058bf38fe10',
        //   "state": '6502c03a518f32014fba79e8',
        //   "name": controller.text.trim(),
        // },
        token: token,
        // query: query
      );
      if (response.statusCode == 200) {
        print('ddwdwd');
        List<dynamic> data = response.data;
        doctors =
            data.map((item) => ViewAllDoctorsModel.fromJson(item)).toList();
        loadingDoctors = false;
        doctorsError = null;
        update();
      } else {
        print('ddwdeeeeewd');
        print(response.statusMessage);
        loadingDoctors = false;
        doctorsError = response.statusMessage;
        update();
      }
    } catch (e) {
      print(e);
      loadingDoctors = false;
      doctorsError = e;
      update();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
