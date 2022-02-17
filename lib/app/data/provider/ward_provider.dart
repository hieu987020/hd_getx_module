import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class WardProvider {
  Future<List<Ward>> fetchWards() async {
    List<Ward> result = (wardJson).map((p) => Ward.fromMap(p)).toList();
    return result;
  }
}
