// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:get/get.dart';
import 'package:hd_getx_module/app/data/model/model.dart';
import 'package:hd_getx_module/app/data/repositories/repositories.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

class AddressController extends GetxController {
  // Provider
  final CityRepository _cityRepository = CityRepository();
  final DistrictRepository _districtRepository = DistrictRepository();
  final WardRepository _wardRepository = WardRepository();

  // DropdownButton hint text
  late final String _cityHint;
  late final String _districtHint;
  late final String _wardHint;

  // Address Style
  Rx<LayoutMode> layoutMode = LayoutMode.oneColumn.obs;

  // Label enable
  Rx<bool> labelEnable = true.obs;

  // DropdownButton list string item
  RxList<String> cityItems = [''].obs;
  RxList<String> districtItems = [''].obs;
  RxList<String> wardItems = [''].obs;

  // DropdownButton selected item
  RxString selectedCityItem = ''.obs;
  RxString selectedDistrictItem = ''.obs;
  RxString selectedWardItem = ''.obs;

  /// Init data
  void initValue(String cityHint, String districtHint, String wardHint) async {
    // Init default hint text
    _cityHint = cityHint;
    _districtHint = districtHint;
    _wardHint = wardHint;

    // Init list string of city, district, ward
    // API get list string city
    cityItems.value = await getCityItems();
    districtItems.value = [districtHint];
    wardItems.value = [wardHint];

    // Init default selected value of DropdownButton
    selectedCityItem.value = cityHint;
    selectedDistrictItem.value = districtHint;
    selectedWardItem.value = wardHint;
  }

  /// On & Off Label
  void showLabel() {
    labelEnable.value = !labelEnable.value;
  }

  /// Change Layout Mode
  void changeLayoutMode(LayoutMode add) {
    layoutMode.value = add;
  }

  /// Field Postcode on change
  Future<void> onChangePostcode(String postCode) async {
    switch (postCode.length) {
      case 2:
        String cityName = '';
        List<City> listCities = await _cityRepository.getCities();
        listCities.forEach((element) {
          if (element.code == postCode) {
            cityName = element.name!;
            return;
          }
        });
        if (cityName.isEmpty) {
          await cityOnChange(_cityHint);
        } else {
          await cityOnChange(cityName);
        }
        break;
      case 3:
        List<District> listDistricts = await _districtRepository.getDistricts();
        District? district;
        listDistricts.forEach((element) {
          if (element.code == postCode) {
            district = element;
            return;
          }
        });
        if (district == null) {
          await cityOnChange(_cityHint);
        } else {
          await onChangePostcode(district!.parentCode!);
          await districtOnChange(district!.name!);
        }
        break;

      case 5:
        List<Ward> listWards = await _wardRepository.getWards();
        Ward? ward;
        listWards.forEach((element) {
          if (element.code == postCode) {
            ward = element;
            return;
          }
        });
        if (ward == null) {
          cityOnChange(_cityHint);
        } else {
          await onChangePostcode(ward!.parentCode!);
          await wardOnChange(ward!.name!);
        }
        break;
      default:
        await cityOnChange(_cityHint);
    }
  }

  /// Field City on change
  Future<String> cityOnChange(String cityName) async {
    log('City on change : $cityName');

    // Assign new value to selected item obs
    selectedCityItem.value = cityName;

    // Get District items
    districtItems.value = await getDistrictItems(cityName);

    // Get selected District item
    selectedDistrictItem.value = _districtHint;

    // Get Ward items
    wardItems.value = [_wardHint];

    // Get selected Ward item
    selectedWardItem.value = _wardHint;

    // Get selected code
    String selectedCode = '';
    List<City> listCities = await _cityRepository.getCities();
    listCities.forEach((element) {
      if (element.name == cityName) {
        selectedCode = element.code!;
        return;
      }
    });
    return selectedCode;
  }

  /// Field District on change
  Future<String> districtOnChange(String newValue) async {
    // Assign new value to selected item obs
    selectedDistrictItem.value = newValue;

    log('District on change : $newValue');

    // Get Ward items by District
    wardItems.value = await getWardItems(newValue);

    // Get selected Ward item
    selectedWardItem.value = _wardHint;

    // Get selected code
    String selectedCode = '';
    List<District> listDistricts = await _districtRepository.getDistricts();
    listDistricts.forEach((element) {
      if (element.name == newValue) {
        selectedCode = element.code!;
        return;
      }
    });
    return selectedCode;
  }

  /// Field Ward on change
  Future<String> wardOnChange(String newValue) async {
    // Assign new value to selected item obs
    selectedWardItem.value = newValue;

    log('Ward on change : $newValue');

    // Get selected code
    String selectedCode = '';
    List<Ward> listWards = await _wardRepository.getWards();
    listWards.forEach((element) {
      if (element.name == newValue) {
        selectedCode = element.code!;
        return;
      }
    });
    return selectedCode;
  }

  /// Get List City Items
  Future<List<String>> getCityItems() async {
    // Call API
    List<City> listCity = await _cityRepository.getCities();

    // Add default item
    List<String> listItems = [_cityHint];

    // Add Network List String to List items
    listCity.forEach((element) {
      listItems.add(element.name!);
    });
    return listItems;
  }

  /// Get List Districts Items
  Future<List<String>> getDistrictItems(String cityName) async {
    // Call API District
    List<District> listDistricts = await _districtRepository.getDistricts();

    // Call API City
    List<City> listCities = await _cityRepository.getCities();

    // Get District items
    List<String> listItems = [_districtHint];

    // Selected City's code
    String selectedCode = '';

    // Get City's code
    listCities.forEach((element) {
      if (element.name == cityName) {
        selectedCode = element.code!;
      }
    });

    // Get the choosen District items
    listDistricts.forEach((element) {
      if (element.parentCode == selectedCode) {
        listItems.add(element.name!);
      }
    });

    return listItems;
  }

  /// Get List Ward Items
  Future<List<String>> getWardItems(String districtName) async {
    // Call API Ward
    List<Ward> listWards = await _wardRepository.getWards();

    // Call API District
    List<District> listDistricts = await _districtRepository.getDistricts();

    // Get Ward items
    List<String> listItems = [_wardHint];

    // Selected District's code
    String selectedCode = '';

    // Get District's code
    listDistricts.forEach((element) {
      if (element.name == districtName) {
        selectedCode = element.code!;
      }
    });

    // Get the choosen Ward items
    listWards.forEach((element) {
      if (element.parentCode == selectedCode) {
        listItems.add(element.name!);
      }
    });
    return listItems;
  }
}
