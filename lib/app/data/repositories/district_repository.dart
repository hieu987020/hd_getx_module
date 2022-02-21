import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

class DistrictRepository {
  final DistrictProvider districtProvider = DistrictProvider();

  Future<List<District>> getDistricts() async {
    await districtProvider.getDistricts();
    List<District> result =
        (districtJson).map((p) => District.fromMap(p)).toList();
    return result;
  }
}
