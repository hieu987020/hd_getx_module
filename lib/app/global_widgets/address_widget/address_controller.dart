// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

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

  late final selectedCity = RxnString();
  late final selectedDistrict = RxnString();
  late final selectedWard = RxnString();
  final output = ''.obs;
  final Provider provider = Provider();

  late final String _cityHint;
  late final String _districtHint;
  late final String _wardHint;

  late final List<City> _city;
  List<District> _district = [];
  List<Ward> _ward = [];

  void onChangePostcode(String? value) async {
    if (value != null) {
      if (value.length < 3) {
        _city.forEach((element) {
          if (element.code == value) {
            cityOnChange(element.name);
          }
        });
      } else if (value.length == 3) {
        var districtListTemp = await provider.fakeDistrict();
        var temp = District();
        districtListTemp.forEach((element) {
          if (element.code == value) {
            temp = element;
            return;
          }
        });
        onChangePostcode(temp.parentCode);
        districtOnChange(temp.name);
      } else if (value.length == 5) {
        var wardListTemp = await provider.fakeWard();
        var temp = Ward();
        wardListTemp.forEach((element) {
          if (element.code == value) {
            temp = element;
            return;
          }
        });
        onChangePostcode(temp.parentCode);
        wardOnChange(temp.name);
      } else {
        cityOnChange(_cityHint);
      }
      // selectedCity.value = 'Vĩnh Phúc';
      // fetchDistricts();
      // selectedDistrict.value = 'Sông Lô';
      // fetchWards();
      // selectedWard.value = 'Lãng Công';
    }
  }

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

  void cityOnChange(String? newValue) {
    selectedCity.value = newValue;
    fetchDistricts();
    selectedDistrict.value = _districtHint;
    // selectedWard.value = _wardHint;
    listWard.value = [_wardHint];
  }

  void districtOnChange(String? newValue) {
    selectedDistrict.value = newValue;
    fetchWards();
    // if (newValue == null) {
    //   selectedDistrict.value = _districtHint;
    // }
    // selectedWard.value = _wardHint;
  }

  void wardOnChange(String? newValue) {
    log(newValue!);
    selectedWard.value = newValue;
  }

  void initNow(String cityHint, String districtHint, String wardHint) {
    _cityHint = cityHint;
    _districtHint = districtHint;
    _wardHint = wardHint;
    listCity.value = [cityHint];
    listDistrict.value = [districtHint];
    listWard.value = [wardHint];
    fetchCities();
    selectedCity.value = cityHint;
    selectedDistrict.value = districtHint;
    selectedWard.value = wardHint;
  }

  void fetchCities() async {
    var result = await provider.fakeCity();
    _city = result;
    List<String> listCityString = [_cityHint];
    result.forEach((element) {
      listCityString.add(element.name!);
    });
    listCity.value = listCityString;
  }

  void fetchDistricts() async {
    // get list district
    var result = await provider.fakeDistrict();
    _district = result;
    // add default hint
    List<String> listDistrictString = [_districtHint];
    var selectedCode = '';
    // get city's code
    _city.forEach((element) {
      if (element.name == selectedCity.value) {
        selectedCode = element.code!;
      }
    });
    // get the choosen list district
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
    List<String> listWardString = [_wardHint];
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
