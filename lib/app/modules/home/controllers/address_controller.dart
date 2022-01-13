import 'package:get/get.dart';
import 'package:hd_getx_module/app/modules/home/views/home_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.row.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeStyle() {
    if (addressStyle.value == AddressStyle.row) {
      addressStyle(AddressStyle.column);
    } else {
      addressStyle(AddressStyle.column);
    }
  }
}
