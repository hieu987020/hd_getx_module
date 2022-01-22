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

  late final List<City> city;
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
    city.forEach((element) {
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
    // listCity(['Hồ Chí Minh', 'Hà Nội']);
    var result = await provider.fakeCity();
    city = result;
    List<String> listCityString = [];
    // ignore: avoid_function_literals_in_foreach_calls
    result.forEach((element) {
      listCityString.add(element.name!);
    });
    listCity.value = listCityString;
  }

  void fetchDistricts() {
    switch (selectedCity.value) {
      case 'Thành phố Hồ Chí Minh':
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
}
