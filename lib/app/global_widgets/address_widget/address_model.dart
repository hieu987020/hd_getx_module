// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_json.dart';
import 'package:http/http.dart' as http;
// {
//   "name": "Tỉnh Cà Mau",
//   "code": 96,
//   "division_type": "tỉnh",
//   "codename": "tinh_ca_mau",
//   "phone_code": 290,
//   "districts": []
// }
//https://provinces.open-api.vn/api
//https://provinces.open-api.vn/api/d
//https://provinces.open-api.vn/api/w
// {
//   "name": "Quận Ba Đình",
//   "code": 1,
//   "division_type": "quận",
//   "codename": "quan_ba_dinh",
//   "province_code": 1,
//   "wards": []
// },

// {
//   "name": "Phường Phúc Xá",
//   "code": 1,
//   "division_type": "phường",
//   "codename": "phuong_phuc_xa",
//   "district_code": 1
// },

class Provider {
  Future<List<City>?> fetchCity() async {
    try {
      var url = Uri.parse('https://provinces.open-api.vn/api/');
      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "access-control-allow-headers":
              "X-CSRF-Token, X-Requested-With, Accept, Accept-Version Content-Length, Content-MD5, Content-Type, Date, X-Api-Version",
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return null;
      // var response = await http.get(url);

      // print(response.body);

      // if (response.statusCode == 200) {
      //   var jsonResponse = json.decode(response.body);

      //   var result = (jsonResponse as List).map((p) => City.fromMap(p)).toList();
      //   print(result.toString());

      //   return result;
      // } else {
      //   print('Request failed with status: ${response.statusCode}.');
      //   throw Exception('error');
      // }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<City>> fakeCity() async {
    var result = (cityJson).map((p) => City.fromMap(p)).toList();
    return result;
  }
}

class City {
  City({this.code, this.name});
  int? code;
  String? name;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      code: map['code'] as int,
      name: map['name'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory City.fromJson(String source) => City.fromMap(json.decode(source));
}

class District {
  District({this.code, this.name, this.provinceCode});
  int? code;
  String? name;
  int? provinceCode;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'provinceCode': provinceCode,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      code: map['code']?.toInt(),
      name: map['name'],
      provinceCode: map['province_code']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source));
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

  String toJson() => json.encode(toMap());

  factory Ward.fromJson(String source) => Ward.fromMap(json.decode(source));
}
