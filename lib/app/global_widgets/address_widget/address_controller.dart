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
    listWard.value = RxList<String>();
    listTown.value = RxList<String>();
  }

  void districtOnChange(String? newValue) {
    selectedDistrict(newValue);
    selectedWard('');
    selectedTown('');
    fetchWards();
    listTown.value = RxList<String>();
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
    switch (selectedCity.value) {
      case 'Hồ Chí Minh':
        listDistrict(['Quận 1', 'Quận 2']);
        break;
      case 'Hà Nội':
        listDistrict(['Quận Hoàn Kiếm', 'Quận Đống Đa']);
        break;
      default:
        listDistrict(RxList<String>());
    }
  }

  void fetchWards() {
    switch (selectedDistrict.value) {
      case 'Quận 1':
        listWard(['Phường 1', 'Phường 2']);
        break;
      case 'Quận Hoàn Kiếm':
        listWard(['Phường Hoàn Kiếm', 'Phường Đống Đa']);
        break;
      default:
        listWard(RxList<String>());
    }
  }

  void fetchTowns() {
    switch (selectedWard.value) {
      case 'Phường 1':
        listTown(['Khu phố 1', 'Khu phố 2']);
        break;
      case 'Phường Hoàn Kiếm':
        listTown(['Khu phố Hoàn Kiếm', 'Khu phố Đống Đa']);
        break;
      default:
        listTown(RxList<String>());
    }
  }

  void getOuput() {
    // output.value = selectedCity.value! + selectedDistrict.value!;
  }

  void initNow(AddressStyle value) {
    addressStyle(value);
    fetchCities();
  }
}
