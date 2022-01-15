import 'package:get/get.dart';
import 'package:hd_getx_module/app/modules/home/local_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.oneColumn.obs;
  void changeStyle() {
    if (addressStyle.value == AddressStyle.oneColumn) {
      addressStyle(AddressStyle.twoColumn);
    } else {
      addressStyle(AddressStyle.oneColumn);
    }
  }
}
