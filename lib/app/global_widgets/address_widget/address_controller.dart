// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_model.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  // Provider
  final Provider provider = Provider();

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
  void initNow(String cityHint, String districtHint, String wardHint) async {
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

  /// Field City on change
  void cityOnChange(String newValue) async {
    // Assign new value to selected item obs
    selectedCityItem.value = newValue;

    // Get District items
    districtItems.value = await getDistrictItems(newValue);

    // Get selected District item
    selectedDistrictItem.value = _districtHint;

    // Get Ward items
    wardItems.value = [_wardHint];

    // Get selected Ward item
    selectedWardItem.value = _wardHint;
  }

  /// Field District on change
  void districtOnChange(String newValue) async {
    // Assign new value to selected item obs
    selectedDistrictItem.value = newValue;

    log('District on change : $newValue');

    // Get Ward items by District
    wardItems.value = await getWardItems(newValue);

    // Get selected Ward item
    selectedWardItem.value = _wardHint;
  }

  /// Field Ward on change
  void wardOnChange(String newValue) {
    // Assign new value to selected item obs
    selectedWardItem.value = newValue;
  }

  /// Get List City Items
  Future<List<String>> getCityItems() async {
    // Call API
    List<City> listCity = await provider.fetchCities();

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
    List<District> listDistricts = await provider.fetchDistricts();

    // Call API City
    List<City> listCities = await provider.fetchCities();

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
    List<Ward> listWards = await provider.fetchWards();

    // Call API District
    List<District> listDistricts = await provider.fetchDistricts();

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

  /// Action when field postcode change
  void onChangePostcode(String value) async {
    switch (value.length) {
      case 2:
        String cityName = '';
        List<City> listCities = await provider.fetchCities();
        listCities.forEach((element) {
          if (element.code == value) {
            cityName = element.name!;
            return;
          }
        });
        if (cityName.isEmpty) {
          cityOnChange(_cityHint);
        } else {
          cityOnChange(cityName);
        }
        break;
      case 3:
        List<District> listDistricts = await provider.fetchDistricts();
        District? district;
        listDistricts.forEach((element) {
          if (element.code == value) {
            district = element;
            return;
          }
        });
        if (district == null) {
          cityOnChange(_cityHint);
        } else {
          onChangePostcode(district!.parentCode!);
          districtOnChange(district!.name!);
        }
        break;

      case 5:
        List<Ward> listWards = await provider.fetchWards();
        Ward? ward;
        listWards.forEach((element) {
          if (element.code == value) {
            ward = element;
            return;
          }
        });
        if (ward == null) {
          cityOnChange(_cityHint);
        } else {
          onChangePostcode(ward!.parentCode!);
          wardOnChange(ward!.name!);
        }
        break;
      default:
        cityOnChange(_cityHint);
    }
  }
}
