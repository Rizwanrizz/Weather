import 'package:get/state_manager.dart';

class FavCityController extends GetxController {
  var favcitylst = [].obs;
  void addtoFav(item) {
    favcitylst.add(item);
  }
}
