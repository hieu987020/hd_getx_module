import 'package:hd_getx_module/app/data/repositories/repositories.dart';

enum AddressFilter {
  listCityName,
  listDistrictName,
  listWardName,
  getCityByPostcode,
  getDistrictByPostcode,
  getWardByPostcode,
  getPostcodeByCityName,
  getPostcodeByDistrictName,
  getPostcodeByWardName,
}

class AddressService {
  AddressService({
    required this.cityRepository,
    required this.districtRepository,
    required this.wardRepository,
  });

  final CityRepository cityRepository;
  final DistrictRepository districtRepository;
  final WardRepository wardRepository;

  addressService({
    AddressFilter? addressFilter,
    String? name,
    String? hintText,
    String? postcode,
  }) async {
    switch (addressFilter) {

      // LIST CITY
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.listCityName:
        String defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listCities = await cityRepository.getCities();
        List<String> listItems = [hintText];

        for (var element in listCities) {
          listItems.add(element.name!);
        }
        return listItems;

      // LIST DISTRICT
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.listDistrictName:
        String defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listDistricts = await districtRepository.getDistricts();

        var listCities = await cityRepository.getCities();

        List<String> listItems = [hintText];

        String selectedCode = '';

        for (var element in listCities) {
          if (element.name == name) {
            selectedCode = element.code!;
          }
        }

        for (var element in listDistricts) {
          if (element.parentCode == selectedCode) {
            listItems.add(element.name!);
          }
        }

        return listItems;

      // LIST WARD
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.listWardName:
        String defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listWards = await wardRepository.getWards();

        var listDistricts = await districtRepository.getDistricts();

        List<String> listItems = [hintText];

        String selectedCode = '';

        for (var element in listDistricts) {
          if (element.name == name) {
            selectedCode = element.code!;
          }
        }

        for (var element in listWards) {
          if (element.parentCode == selectedCode) {
            listItems.add(element.name!);
          }
        }
        return listItems;

      // LIST WARD
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getCityByPostcode:
        var listCities = await cityRepository.getCities();
        for (var element in listCities) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;

      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getDistrictByPostcode:
        var listDistricts = await districtRepository.getDistricts();
        for (var element in listDistricts) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getWardByPostcode:
        var listWards = await wardRepository.getWards();
        for (var element in listWards) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getPostcodeByCityName:
        String? postcode;
        var listCities = await cityRepository.getCities();
        for (var element in listCities) {
          if (element.name == name) {
            postcode = element.code!;
            break;
          }
        }
        return postcode;
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getPostcodeByDistrictName:
        String? postcode;
        var listDistricts = await districtRepository.getDistricts();
        for (var element in listDistricts) {
          if (element.name == name) {
            postcode = element.code!;
            break;
          }
        }
        return postcode;
      // --------------------
      // --------------------
      // --------------------
      case AddressFilter.getPostcodeByWardName:
        String? postcode;
        var listWards = await wardRepository.getWards();
        for (var element in listWards) {
          if (element.name == name) {
            postcode = element.code!;
            break;
          }
        }
        return postcode;
      default:
    }
  }
}
