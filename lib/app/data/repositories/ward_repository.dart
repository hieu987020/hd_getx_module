import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class WardRepository {
  final WardProvider wardProvider = WardProvider();

  Future<List<Ward>> getWards() async {
    await wardProvider.getWards();
    List<Ward> result = (wardJson).map((p) => Ward.fromMap(p)).toList();
    return result;
  }
}
