import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = Rxn<AddressStyle>();
  final listCity = RxList<String>();
  final listDistrict = RxList<String>();
  final selectedCity = RxnString();
  final selectedDistrict = RxnString();

  final output = RxnString();
  // get addressStyle => _addressStyle.value;
  // set addressStyle(value) => _addressStyle.value = value;

  changeStyle() {
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
    String? nullVal;
    selectedCity(newValue);
    selectedDistrict.value = nullVal;
    fetchDistricts();
  }

  void districtOnChange(String? newValue) {
    selectedDistrict(newValue);
  }

  void fetchCities() => listCity(['Hồ Chí Minh', 'Hà Nội']);

  void fetchDistricts() {
    List<String>? list;
    switch (selectedCity.value) {
      case 'Hồ Chí Minh':
        list = ['Quận 1', 'Quận 2'];
        break;
      case 'Hà Nội':
        list = ['Quận Hoàn Kiếm', 'Quận Ba Đình'];
        break;
    }
    listDistrict(list);
  }

  void getOuput() {
    output.value = selectedCity.value! + selectedDistrict.value!;
  }

  void initNow(AddressStyle value) {
    addressStyle(value);
    fetchCities();
  }
}
