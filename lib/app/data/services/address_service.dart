import 'package:hd_getx_module/app/data/repositories/repositories.dart';

enum AddressCase {
  /// Get list city's name
  listCityName,

  /// Get list district's name by city's name
  listDistrictName,

  /// Get list ward's name by district's name
  listWardName,

  /// Get city by postcode
  getCityByPostcode,

  /// Get district by postcode
  getDistrictByPostcode,

  /// Get ward by postcode
  getWardByPostcode,

  /// Get postcode by city's name
  getPostcodeByCityName,

  /// Get postcode by district's name
  getPostcodeByDistrictName,

  /// Get postcode by ward's name
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

  dynamic serviceFunction({
    AddressCase? addressFilter,
    String? name,
    String? hintText,
    String? postcode,
  }) async {
    switch (addressFilter) {
      case AddressCase.listCityName:
        var defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listCities = await cityRepository.getCities();
        var listItems = [hintText];

        for (var element in listCities) {
          listItems.add(element.name!);
        }
        return listItems;
      case AddressCase.listDistrictName:
        var defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listDistricts = await districtRepository.getDistricts();

        var listCities = await cityRepository.getCities();

        var listItems = [hintText];

        var selectedCode = '';

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

      case AddressCase.listWardName:
        String defaultHintText = '';
        (hintText == null) ? hintText = defaultHintText : hintText = hintText;
        var listWards = await wardRepository.getWards();

        var listDistricts = await districtRepository.getDistricts();

        var listItems = [hintText];

        var selectedCode = '';

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

      case AddressCase.getCityByPostcode:
        var listCities = await cityRepository.getCities();
        for (var element in listCities) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;

      case AddressCase.getDistrictByPostcode:
        var listDistricts = await districtRepository.getDistricts();
        for (var element in listDistricts) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;

      case AddressCase.getWardByPostcode:
        var listWards = await wardRepository.getWards();
        for (var element in listWards) {
          if (element.code == postcode) {
            return element;
          }
        }
        return null;

      case AddressCase.getPostcodeByCityName:
        String? postcode;
        var listCities = await cityRepository.getCities();
        for (var element in listCities) {
          if (element.name == name) {
            postcode = element.code!;
            break;
          }
        }
        return postcode;

      case AddressCase.getPostcodeByDistrictName:
        String? postcode;
        var listDistricts = await districtRepository.getDistricts();
        for (var element in listDistricts) {
          if (element.name == name) {
            postcode = element.code!;
            break;
          }
        }
        return postcode;

      case AddressCase.getPostcodeByWardName:
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
