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
  final selectedTown = RxnString();
  final output = ''.obs;
  final Provider provider = Provider();
  // Map<String, dynamic> json = {
  //   "city": "",
  //   "district": "",
  //   "ward": "",
  //   "town": "",
  //   "street": "",
  //   "postCode": "",
  // };
// void getInputFromJson(Map<String, dynamic> json) {}
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
    selectedDistrict.value = null;
    selectedWard.value = null;
    selectedTown.value = null;
    fetchDistricts();
    listWard.value = RxList<String>();
    listTown.value = RxList<String>();
  }

  void districtOnChange(String? newValue) {
    selectedDistrict.value = newValue;
    selectedWard.value = null;
    selectedTown.value = null;
    fetchWards();
    listTown.value = RxList<String>();
  }

  void wardOnChange(String? newValue) {
    selectedWard.value = newValue;
    selectedTown.value = null;
    fetchTowns();
  }

  void townOnChange(String? newValue) {
    selectedTown.value = newValue;
  }

  void fetchCities() async {
    // listCity(['Hồ Chí Minh', 'Hà Nội']);
    var result = await provider.fakeCity();
    List<String> listCityString = [];
    result.forEach((element) {
      listCityString.add(element.name!);
    });
    listCity.value = listCityString;
  }

  void fetchDistricts() {
    switch (selectedCity.value) {
      case 'Hồ Chí Minh':
        listDistrict.value = ['Quận 1', 'Quận 2'];
        break;
      case 'Hà Nội':
        listDistrict.value = ['Quận Hoàn Kiếm', 'Quận Đống Đa'];
        break;
      default:
        listDistrict.value = RxList<String>();
    }
  }

  void fetchWards() {
    switch (selectedDistrict.value) {
      case 'Quận 1':
        listWard.value = ['Phường 1', 'Phường 2'];

        break;
      case 'Quận Hoàn Kiếm':
        listWard.value = ['Phường Hoàn Kiếm', 'Phường Đống Đa'];
        break;
      default:
        listWard.value = RxList<String>();
    }
  }

  void fetchTowns() {
    switch (selectedWard.value) {
      case 'Phường 1':
        listTown.value = ['Khu phố 1', 'Khu phố 2'];
        break;
      case 'Phường Hoàn Kiếm':
        listTown.value = ['Khu phố Hoàn Kiếm', 'Khu phố Đống Đa'];
        break;
      default:
        listTown.value = RxList<String>();
    }
  }

  void getOuput() {
    // output.value = selectedCity.value! + selectedDistrict.value!;
  }

  void initNow() {
    fetchCities();
  }
}
