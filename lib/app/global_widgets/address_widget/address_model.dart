// ignore_for_file: avoid_print

import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';

class Provider {
  Future<List<City>> fakeCity() async {
    var result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }

  Future<List<District>> fakeDistrict() async {
    var result = (districtJson).map((p) => District.fromMap(p)).toList();
    return result;
  }
}

class City {
  City({this.code, this.name});
  String? code;
  String? name;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }
}

class District {
  District({this.code, this.name, this.parentCode});
  String? code;
  String? name;
  String? parentCode;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'parent_code': parentCode,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      code: map['code'] as String,
      name: map['name'],
      parentCode: map['parent_code'] as String,
    );
  }
}

class Ward {
  Ward({this.code, this.name, this.districtCode});
  int? code;
  String? name;
  int? districtCode;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'district_code': districtCode,
    };
  }

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      code: map['code']?.toInt(),
      name: map['name'],
      districtCode: map['districtCode']?.toInt(),
    );
  }
}
