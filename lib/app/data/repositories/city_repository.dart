import 'dart:developer';

import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

class CityRepository {
  final CityProvider cityProvider = CityProvider();

  Future<List<City>> getCities() async {
    await cityProvider.getCities();
    List<City> result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }

  Future<List<City>> getCitiesWithName(String name) async {
    log('hello $name');
    await cityProvider.getCities();
    List<City> result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }
}
