import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class DistrictProvider {
  Future<List<District>> fetchDistricts() async {
    List<District> result =
        (districtJson).map((p) => District.fromMap(p)).toList();
    return result;
  }
}
