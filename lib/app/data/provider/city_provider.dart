import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class CityProvider {
  Future<List<City>> fetchCities() async {
    List<City> result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }
}
