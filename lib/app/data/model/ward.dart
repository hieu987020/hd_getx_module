class Ward {
  Ward({this.code, this.name, this.parentCode});
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

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      code: map['code'] as String,
      name: map['name'] as String,
      parentCode: map['parent_code'] as String,
    );
  }
}
