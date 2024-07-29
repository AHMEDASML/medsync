import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/endpoints/url_api.dart';
import 'package:medsync/global/models/body/appointments_model.dart';
import 'package:medsync/global/utils/key_shared.dart';

class AppointmentsController extends GetxController {
  var token = CacheHelper.getData(key: TOKEN);
  bool loading = false;
  AppointmentsModel? appointmentsModel;

  Future<void> getAllAppointments() async {
    try {
      var response = await DioHelper.getData(
          url: '$BASE_URL/api/doctors/get-patient-dates', token: token);
      if (response.statusCode == 200) {
        var data = response.data;
        var bookingDatesList =
            List<Map<String, dynamic>>.from(data['bookingDates']);
        var bookingDates = bookingDatesList
            .map<BookingDate>((item) => BookingDate.fromJson(item))
            .toList();

        appointmentsModel = AppointmentsModel(bookingDates: bookingDates);

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
    getAllAppointments();
    super.onInit();
  }
  @override
  void onClose() {
    appointmentsModel = null;
    super.dispose();

    super.onClose();
  }

  @override
  void dispose() {
    print('BBBBBBBBBBBBBBBBBBBBBBBB');
    // Dispose of resources, subscriptions, or anything that needs cleanup
    // Clear any data or variables to free up memory
    appointmentsModel = null; // Clear appointmentsModel
    super.dispose();
  }


}
