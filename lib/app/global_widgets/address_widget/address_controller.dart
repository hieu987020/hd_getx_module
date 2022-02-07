// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.oneColumn.obs;
  final showLabel = true.obs;

  final listCity = [''].obs;
  final listDistrict = RxList<String>();
  final listWard = RxList<String>();
  final listTown = RxList<String>();

  final selectedCity = RxnString();
  final selectedDistrict = RxnString();
  final selectedWard = RxnString();
  final output = ''.obs;
  final Provider provider = Provider();

  late final List<City> _city;
  List<District> _district = [];
  List<Ward> _ward = [];
  void changeShowLabel() {
    showLabel.value = !showLabel.value;
  }

  void changeStyle() {
    switch (addressStyle.value) {
      case AddressStyle.oneColumn:
        addressStyle.value = AddressStyle.twoColumn;
        break;
      case AddressStyle.twoColumn:
        addressStyle.value = AddressStyle.oneColumn;
        break;
      default:
    }
  }

  void postCodeSubmit(String postCode) {
    _city.forEach((element) {
      if (element.code == postCode) {
        // fetchDistricts();
        selectedCity.value = element.name;
        return;
      }
    });
  }

  void cityOnChange(String? newValue) {
    selectedCity.value = newValue;
    selectedDistrict.value = null;
    selectedWard.value = null;
    fetchDistricts();
    listWard.value = RxList<String>();
    listTown.value = RxList<String>();
  }

  void districtOnChange(String? newValue) {
    selectedDistrict.value = newValue;
    selectedWard.value = null;
    fetchWards();
    listTown.value = RxList<String>();
  }

  void wardOnChange(String? newValue) {
    selectedWard.value = newValue;
  }

  void initNow() {
    fetchCities();
  }

  void fetchCities() async {
    var result = await provider.fakeCity();
    _city = result;
    List<String> listCityString = [];
    result.forEach((element) {
      listCityString.add(element.name!);
    });
    listCity.value = listCityString;
  }

  void fetchDistricts() async {
    var result = await provider.fakeDistrict();
    _district = result;
    List<String> listDistrictString = [];
    var selectedCode = '';
    _city.forEach((element) {
      if (element.name == selectedCity.value) {
        selectedCode = element.code!;
      }
    });
    _district.forEach((element) {
      if (element.parentCode == selectedCode) {
        listDistrictString.add(element.name!);
      }
    });
    listDistrict.value = listDistrictString;
  }

  void fetchWards() async {
    var result = await provider.fakeWard();
    _ward = result;
    List<String> listWardString = [];
    var selectedCode = '';
    _district.forEach((element) {
      if (element.name == selectedDistrict.value) {
        selectedCode = element.code!;
      }
    });
    _ward.forEach((element) {
      if (element.parentCode == selectedCode) {
        listWardString.add(element.name!);
      }
    });
    listWard.value = listWardString;
  }
}
