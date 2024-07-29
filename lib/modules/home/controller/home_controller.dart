import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<Position> getUserCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print('DWEFWEFEWFWEFWEFWEFWEFWEF1111');
        throw Exception('Location permission permanently denied');
      } else if (permission == LocationPermission.denied) {
        print('DWEFWEFEWFWEFWEFWEFWEFWEF2222222');
        throw Exception('Location permission denied');
      } else {
        final value = await Geolocator.getCurrentPosition();
        print('DWEFWEFEWFWEFWEFWEFWEFWEF33333');
        // print(value.latitude);
        // print(value.longitude);
        latitude = value.latitude;
        longitude = value.longitude;
        print(latitude);
        print(longitude);

        update();

        return await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      throw Exception('Error getting current position: $e');
    }
  }

  @override
  void onInit() {
    getUserCurrentLocation();
    super.onInit();
  }
}

double latitude = 0;
double longitude = 0;
