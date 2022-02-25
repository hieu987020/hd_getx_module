// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:get/get.dart';
import 'package:hd_getx_module/app/data/services/address_service.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

class AddressController extends GetxController {
  // DropdownButton hint text
  late final String _cityHint;
  late final String _districtHint;
  late final String _wardHint;

  late final Future Function({
    AddressFilter? addressFilter,
    String? name,
    String? hintText,
    String? postcode,
  }) dataProvider;

  // Address Style
  var layoutMode = LayoutMode.oneColumn.obs;

  // Label enable
  var labelEnable = true.obs;

  // DropdownButton list string item
  var cityItems = [''].obs;
  var districtItems = [''].obs;
  var wardItems = [''].obs;

  // DropdownButton selected item
  var selectedCityItem = ''.obs;
  var selectedDistrictItem = ''.obs;
  var selectedWardItem = ''.obs;

  /// On & Off Label
  void showLabel() {
    labelEnable.value = !labelEnable.value;
  }

  /// Change Layout Mode
  void changeLayoutMode(LayoutMode add) {
    layoutMode.value = add;
  }

  /// Init data
  void initValue(String cityHint, String districtHint, String wardHint) async {
    // Init default hint text
    _cityHint = cityHint;
    _districtHint = districtHint;
    _wardHint = wardHint;

    // Init list string of city, district, ward
    // API get list string city
    var result = await dataProvider.call(
        addressFilter: AddressFilter.listCityName, hintText: cityHint);

    (result == null) ? cityItems.value = [cityHint] : cityItems.value = result;

    districtItems.value = [districtHint];
    wardItems.value = [wardHint];

    // Init default selected value of DropdownButton
    selectedCityItem.value = cityHint;
    selectedDistrictItem.value = districtHint;
    selectedWardItem.value = wardHint;
  }

  /// Field Postcode on change
  Future<void> onChangePostcode(String postCode) async {
    switch (postCode.length) {
      case 2:
        var result = await dataProvider.call(
            addressFilter: AddressFilter.getCityByPostcode, postcode: postCode);
        if (result == null) {
          await cityOnChange(_cityHint);
          log('FAIL: Not Address');
        } else {
          await cityOnChange(result.name!);
          log('SUCCESS: Find City: ${result.name}');
        }
        break;
      case 3:
        var result = await dataProvider.call(
            addressFilter: AddressFilter.getDistrictByPostcode,
            postcode: postCode);
        if (result == null) {
          await cityOnChange(_cityHint);
          log('FAIL: Not Address');
        } else {
          await onChangePostcode(result.parentCode!);
          await districtOnChange(result.name!);
          log('SUCCESS: Find District: ${result.name}');
        }
        break;

      case 5:
        var result = await dataProvider.call(
            addressFilter: AddressFilter.getWardByPostcode, postcode: postCode);
        if (result == null) {
          await cityOnChange(_cityHint);
          log('FAIL: Not Address');
        } else {
          await onChangePostcode(result.parentCode!);
          await wardOnChange(result.name!);
          log('SUCCESS: Find Ward: ${result.name}');
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
    var result = await dataProvider.call(
      addressFilter: AddressFilter.listDistrictName,
      hintText: _districtHint,
      name: cityName,
    );
    (result == null)
        ? districtItems.value = [_districtHint]
        : districtItems.value = result;

    // Get selected District item
    selectedDistrictItem.value = _districtHint;

    // Get Ward items
    wardItems.value = [_wardHint];

    // Get selected Ward item
    selectedWardItem.value = _wardHint;

    // Get selected code
    return await dataProvider.call(
      addressFilter: AddressFilter.getPostcodeByCityName,
      name: cityName,
    );
  }

  /// Field District on change
  Future<String> districtOnChange(String districtName) async {
    log('District on change : $districtName');

    // Assign new value to selected item obs
    selectedDistrictItem.value = districtName;

    // Get Ward items by District
    var result = await dataProvider.call(
      addressFilter: AddressFilter.listWardName,
      hintText: _wardHint,
      name: districtName,
    );
    (result == null) ? wardItems.value = [_wardHint] : wardItems.value = result;

    // Get selected Ward item
    selectedWardItem.value = _wardHint;

    // Get selected code
    return await dataProvider.call(
      addressFilter: AddressFilter.getPostcodeByDistrictName,
      name: districtName,
    );
  }

  /// Field Ward on change
  Future<String> wardOnChange(String wardName) async {
    log('Ward on change : $wardName');

    // Assign new value to selected item obs
    selectedWardItem.value = wardName;

    // Get selected code
    return await dataProvider.call(
      addressFilter: AddressFilter.getPostcodeByWardName,
      name: wardName,
    );
  }
}
