import 'package:hd_getx_module/app/data/api_provider/provider.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

class WardRepository {
  final WardProvider wardProvider = WardProvider();

  Future<List<Ward>> getWards() async {
    await wardProvider.getWards();
    List<Ward> result = (wardJson).map((p) => Ward.fromMap(p)).toList();
    return result;
  }
}
