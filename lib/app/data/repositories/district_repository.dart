import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class DistrictRepository {
  final DistrictProvider districtProvider = DistrictProvider();

  Future<List<District>> getDistricts() async {
    await districtProvider.getDistricts();
    List<District> result =
        (districtJson).map((p) => District.fromMap(p)).toList();
    return result;
  }
}
