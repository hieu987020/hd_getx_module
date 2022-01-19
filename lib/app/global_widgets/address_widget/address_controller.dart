import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';

class AddressController extends GetxController {
  final addressStyle = AddressStyle.oneColumn.obs;
  final listCity = RxList<String>();
  final listDistrict = RxList<String>();
  final listWard = RxList<String>();
  final listTown = RxList<String>();
  final selectedCity = ''.obs;
  final selectedDistrict = ''.obs;
  final selectedWard = ''.obs;
  final selectedTown = ''.obs;
  final output = ''.obs;

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
    selectedCity(newValue);
    selectedDistrict('');
    selectedWard('');
    selectedTown('');
    fetchDistricts();
    // listWard.value = RxList<String>();
    // listTown.value = RxList<String>();
  }

  void districtOnChange(String? newValue) {
    selectedDistrict(newValue);
    selectedWard('');
    selectedTown('');
    fetchWards();
    // listTown.value = RxList<String>();
  }

  void wardOnChange(String? newValue) {
    selectedWard(newValue);
    selectedTown('');
    fetchTowns();
  }

  void townOnChange(String? newValue) {
    selectedTown(newValue);
  }

  void fetchCities() => listCity(['Hồ Chí Minh', 'Hà Nội']);

  void fetchDistricts() {
    List<String>? list;
    switch (selectedCity.value) {
      case 'Hồ Chí Minh':
        list = ['Quận 1'];
        break;
      case 'Hà Nội':
        list = ['Quận Hoàn Kiếm'];
        break;
    }
    listDistrict(list);
  }

  void fetchWards() {
    List<String>? list;
    switch (selectedDistrict.value) {
      case 'Quận 1':
        list = ['Phường 1'];
        break;
      case 'Quận Hoàn Kiếm':
        list = ['Phường Hoàn Kiếm'];
        break;
    }
    listWard(list);
  }

  void fetchTowns() {
    List<String>? list;
    switch (selectedWard.value) {
      case 'Phường 1':
        list = ['Khu phố 1'];
        break;
      case 'Phường Hoàn Kiếm':
        list = ['Khu phố Hoàn Kiếm'];
        break;
    }
    listTown(list);
  }

  void getOuput() {
    // output.value = selectedCity.value! + selectedDistrict.value!;
  }

  void initNow(AddressStyle value) {
    addressStyle(value);
    fetchCities();
  }
}
