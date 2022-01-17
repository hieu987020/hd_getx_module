import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.oneColumn.obs;

  void changeStyle() {
    debugPrint("helloooooooooooooo");
    if (addressStyle.value == AddressStyle.oneColumn) {
      addressStyle(AddressStyle.twoColumn);
    } else {
      addressStyle(AddressStyle.oneColumn);
    }
  }
}
