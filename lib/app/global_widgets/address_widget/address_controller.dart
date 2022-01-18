import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.oneColumn.obs;
  final listCity = [''].obs;
  final listDistrict = [''].obs;
  final selectedCity = ''.obs;
  final selectedDistrict = ''.obs;

  void changeStyle() {
    debugPrint('helloooooooooooooo');
    if (addressStyle.value == AddressStyle.oneColumn) {
      addressStyle(AddressStyle.twoColumn);
    } else {
      addressStyle(AddressStyle.oneColumn);
    }
  }

  void fetchCities() {
    var list = ['Hồ Chí Minh', 'Hà Nội'];
    listCity(list);
  }

  void setSelectedCity(String value) {
    selectedCity(value);
  }

  void fetchDistricts() {
    var list = [''];
    if (selectedCity.value == 'Hồ Chí Minh') {
      list = ['Quận 1', 'Quận 2'];
    } else {
      list = ['Quận Hoàn Kiếm', 'Quận Ba Đình'];
    }
    listDistrict(list);
  }

  void setSelectedDistrict(String value) {
    selectedDistrict(value);
  }

  void initNow() {
    fetchCities();
    selectedCity(null);
    // print('Init ne');
    // print(listCity.value);
    // print(selectedCity.value);
  }
}
