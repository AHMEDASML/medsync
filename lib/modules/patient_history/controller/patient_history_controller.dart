import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/prescriptions_model.dart';
import 'package:medsync/global/models/body/reports_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

class PatientHistoryController extends GetxController{


  bool loading = false;

  final token = CacheHelper.getData(key: TOKEN);
  late List<PrescriptionsModel> prescriptionsModel=[];
  late List<ReportsModel> reportsModel=[];

  Future <void>getPrescriptions() async {

    try {
      var response =
      await DioHelper.getData(url: '$BASE_URL/api/doctors/patient-prescriptions', token: token);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        prescriptionsModel = data.map((item) => PrescriptionsModel.fromJson(item)).toList();
        print(prescriptionsModel.length);

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


  Future <void>getAllReports() async {

    try {
      var response =
      await DioHelper.getData(url: '$BASE_URL/api/doctors/patient-medical-reports', token: token);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        reportsModel = data.map((item) => ReportsModel.fromJson(item)).toList();
        print(reportsModel.length);

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
  void onInit() {
    getPrescriptions();
    getAllReports();
    super.onInit();
  }
}