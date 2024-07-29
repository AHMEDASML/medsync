import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/municipalities_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

import '../../../global/models/body/farmasy_model.dart';

class FarmaController extends GetxController {
  String? idState;

  bool loading = false;
  bool loadingDoctors = true;
  dynamic doctorsError;

  final token = CacheHelper.getData(key: TOKEN);

  // String _prev = "";
  // TextEditingController controller = TextEditingController();

  MunicipalitieModel? municipalitieModel;
  late List<MunicipalitiesModel> municipalitiesModel;
  late List<FarmasyModel> doctors;


  fill({required String? idState}) {
    this.idState = idState;
  }

  void select(MunicipalitieModel? municipalitieModel) {
    this.municipalitieModel = municipalitieModel;
    update();
    getViewAllDoctors(
      state: idState,
      municipality: municipalitieModel!.id,
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
      { String? municipality, String? state}) async {
    try {
      loadingDoctors = true;
      doctorsError = null;
      var response = await DioHelper.getData(
        url: '$BASE_URL/api/pharmacists/search-for-pharmacy',
        query: {
          "municipality": municipality,
          "state": state,
          // "name": controller.text.trim(),
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
            data.map((item) => FarmasyModel.fromJson(item)).toList();
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

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}

// import 'package:get/get.dart';
// import 'package:medsync/global/data/local/cache_helper.dart';
// import 'package:medsync/global/data/remote/dio_helper.dart';
// import 'package:medsync/global/endpoints/url_api.dart';
// import 'package:medsync/global/models/body/laboratories_model.dart';
// import 'package:medsync/global/utils/key_shared.dart';

// class LaboratoriesController extends GetxController {
//   bool loading = false;
//   bool error = false;
//   String errorMessage = '';
//   final token = CacheHelper.getData(key: TOKEN);
//
//   List<LaboratoriesModel> laboratoriesModel = [];
//
//   String ddd =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTAwNTFmOTJjYWU3MWRlZjczNjc4M2QiLCJpc1VzZXIiOnRydWUsImlhdCI6MTY5NDY4MjE0MH0.hZldEyI2uaLMB-nOML61nlDjs7JfWfvDIn0DL_qKgjk';
//
//   Future<void> getAllLaboratories(
//       {required String state, required String municipality}) async {
//     try {
//       var response = await DioHelper.getData(
//         url:
//             '$BASE_URL/api/laboratories/searchForLaboratory?state=$state&municipality=$municipality',
//         // token: token ?? ''
//         token: ddd,
//       );
//       if (response.statusCode == 200) {
//         List<dynamic> data = response.data;
//         laboratoriesModel =
//             data.map((item) => LaboratoriesModel.fromJson(item)).toList();
//         print(laboratoriesModel.length);
//         loading = true;
//         update();
//       } else {
//         error = true;
//         errorMessage = response.statusMessage ?? 'Unknown error';
//         print(response.statusMessage);
//       }
//     } catch (e) {
//       error = true;
//       errorMessage = e.toString();
//       print(e.toString());
//     }
//   }
//
//   @override
//   void onInit() {
//     getAllLaboratories(state: '', municipality: '');
//     super.onInit();
//   }
// }
