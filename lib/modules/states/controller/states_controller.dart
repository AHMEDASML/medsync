import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/states_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

class StatesController extends GetxController {
  bool loading = false;

  final token = CacheHelper.getData(key: TOKEN);

   late List<StatesModel> statesModel;

  @override
  void onInit() {
    getAllStates();
    super.onInit();
  }


  Future<void> getAllStates() async {
    try {
      var response =
          await DioHelper.getData(url: '$BASE_URL$GetStates', token: token);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        statesModel = data.map((item) => StatesModel.fromJson(item)).toList();
        print(statesModel.length);

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
}
