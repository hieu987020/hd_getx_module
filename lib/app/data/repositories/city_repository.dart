import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class CityRepository {
  final CityProvider cityProvider = CityProvider();

  Future<List<City>> getCities() async {
    await cityProvider.getCities();
    List<City> result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }
}
