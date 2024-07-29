import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/municipalities_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

import '../../../global/models/body/medication_suggestions_model.dart';
import '../../../global/models/body/search_models.dart';
import '../../../global/models/body/states_model.dart';

class MedsController extends GetxController {
  bool loadingState = true;
  bool loadingMeds = true;
  bool loadingMun = true;
  dynamic stateError;
  dynamic medsError;
  dynamic munError;

  final token = CacheHelper.getData(key: TOKEN);

  // String _prev = "";
  TextEditingController controller = TextEditingController();
  MedicationSuggestion? suggestion;
  StatesModel? idState;
  MunicipalitieModel? municipalitieModel;

  List<MedicationSuggestion> suggestions = [];
  late List<StatesModel> statesModel;
  late List<MunicipalitiesModel> municipalitiesModel;
  late List<SearchPharmaciesModels> doctors;


  // @override
  // void onInit() {
  //   controller.addListener(() {
  //     if (_prev != controller.text.trim()) {
  //       _prev = controller.text.trim();
  //       getSuggestion();
  //     }
  //   });
  //   super.onInit();
  // }

  void selectSuggestion(MedicationSuggestion? suggestion) {
    this.suggestion = suggestion;
    update();
    getViewAllDoctors();
  }

  void selectStatesModel(StatesModel? statesModel) {
    idState = statesModel;
    update();
    getMunicipalities();
  }

  void selectMunicipalitie(MunicipalitieModel? municipalitieModel) {
    this.municipalitieModel = municipalitieModel;
    update();
    getViewAllDoctors();
  }

  Future<List<MedicationSuggestion>> getSuggestion(String pattern) async {
    try {
      var response = await DioHelper.getData(
        // url: '$BASE_URL$SERCH_MEDICINE$input',
        url: '$BASE_URL/api/pharmacists/pharmacist-complete-name',
        token: token,
        query: {
          'name_medicine': pattern,
        },
      );
      if (response.statusCode == 200) {
        print(response.data.toString());
        suggestions = List<MedicationSuggestion>.from(
            response.data["data"].map((x) => MedicationSuggestion.fromJson(x)));
        update();
        return suggestions;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
    return suggestions;
  }

  Future<void> getAllStates() async {
    try {
      loadingState = true;
      stateError = null;
      var response =
          await DioHelper.getData(url: '$BASE_URL$GetStates', token: token);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        statesModel = data.map((item) => StatesModel.fromJson(item)).toList();
        idState = statesModel.first;
        print(statesModel.length);
        loadingState = false;
        stateError = null;
        getMunicipalities();
        update();
      } else {
        print(response.statusMessage);
        stateError = response.statusMessage;
        loadingState = false;
      }
    } catch (e) {
      print(e.toString());
      stateError = e;
      loadingState = false;
    } finally {
      update();
    }
  }

  Future<void> getMunicipalities() async {
    try {
      loadingMun = true;
      munError = null;
      var response = await DioHelper.getData(
          url: '$BASE_URL/api/admins/municipalities-by-state/${idState!.id}');
      if (response.statusCode == 200) {
        print(response.data);
        municipalitiesModel = [MunicipalitiesModel.fromJson(response.data)];
        municipalitieModel = municipalitiesModel.first.data.first;
        loadingMun = false;
        munError = null;
        update();
        getViewAllDoctors();
      } else {
        print(response.statusMessage);
        loadingMun = false;
        munError = response.statusMessage;
      }
    } catch (e) {
      print(e.toString());
      loadingMun = false;
      munError = e;
    } finally {
      update();
    }
  }

  Future<void> getViewAllDoctors() async {
    try {
      loadingMeds = true;
      medsError = null;
      var response = await DioHelper.getData(
        url: '$BASE_URL/api/pharmacists/pharmacist-medicine-search',
        query: {
          "municipality": municipalitieModel!.id,
          "state": idState!.id,
          "brand_name": suggestion?.brandName,
        },
        token: token,
        // query: query
      );
      if (response.statusCode == 200) {
        print(response.data);
        List<dynamic> data = response.data;
        doctors =
            data.map((item) => SearchPharmaciesModels.fromJson(item)).toList();
        loadingMeds = false;
        medsError = null;
        update();
      } else {
        print('ddwdeeeeewd');
        print(response.statusMessage);
        loadingMeds = false;
        medsError = response.statusMessage;
        update();
      }
    } catch (e) {
      rethrow;
      loadingMeds = false;
      medsError = e;
      update();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
