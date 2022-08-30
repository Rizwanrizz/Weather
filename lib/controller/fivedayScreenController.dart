import 'package:get/state_manager.dart';

class FiveDayController extends GetxController {
  dynamic city = "riyadh".obs;
  dynamic lat = 51.5085.obs;
  dynamic lon = (-0.1257).obs;

  dynamic updateVal(newCity, Newlat, Newlon) {
    dynamic city = newCity;
    dynamic lat = Newlat;
    dynamic lon = Newlon;
  }
}
