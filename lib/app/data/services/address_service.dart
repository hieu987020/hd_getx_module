import 'package:hd_getx_module/app/data/repositories/repositories.dart';

class AddressService {
  final CityRepository cityRepository = CityRepository();
  final DistrictRepository districtRepository = DistrictRepository();
  final WardRepository wardRepository = WardRepository();
}
