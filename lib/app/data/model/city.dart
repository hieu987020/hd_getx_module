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