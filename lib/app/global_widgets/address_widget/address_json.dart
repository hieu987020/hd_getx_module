var cityJson = [
  {
    "name": "Vĩnh Phúc",
    "slug": "vinh-phuc",
    "type": "tinh",
    "name_with_type": "Tỉnh Vĩnh Phúc",
    "code": "26"
  },
  {
    "name": "Ninh Bình",
    "slug": "ninh-binh",
    "type": "tinh",
    "name_with_type": "Tỉnh Ninh Bình",
    "code": "37"
  }
];
var districtJson = [
  {
    "name": "Vĩnh Tường",
    "type": "huyen",
    "slug": "vinh-tuong",
    "name_with_type": "Huyện Vĩnh Tường",
    "path": "Vĩnh Tường, Vĩnh Phúc",
    "path_with_type": "Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc",
    "code": "252",
    "parent_code": "26"
  },
  {
    "name": "Sông Lô",
    "type": "huyen",
    "slug": "song-lo",
    "name_with_type": "Huyện Sông Lô",
    "path": "Sông Lô, Vĩnh Phúc",
    "path_with_type": "Huyện Sông Lô, Tỉnh Vĩnh Phúc",
    "code": "253",
    "parent_code": "26"
  },
  {
    "name": "Ninh Bình",
    "type": "thanh-pho",
    "slug": "ninh-binh",
    "name_with_type": "Thành phố Ninh Bình",
    "path": "Ninh Bình, Ninh Bình",
    "path_with_type": "Thành phố Ninh Bình, Tỉnh Ninh Bình",
    "code": "369",
    "parent_code": "37"
  },
  {
    "name": "Tam Điệp",
    "type": "thanh-pho",
    "slug": "tam-diep",
    "name_with_type": "Thành phố Tam Điệp",
    "path": "Tam Điệp, Ninh Bình",
    "path_with_type": "Thành phố Tam Điệp, Tỉnh Ninh Bình",
    "code": "370",
    "parent_code": "37"
  },
];
var wardJson = [
  {
    "name": "Vĩnh Tường",
    "type": "thi-tran",
    "slug": "vinh-tuong",
    "name_with_type": "Thị trấn Vĩnh Tường",
    "path": "Vĩnh Tường, Vĩnh Tường, Vĩnh Phúc",
    "path_with_type": "Thị trấn Vĩnh Tường, Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc",
    "code": "09076",
    "parent_code": "252"
  },
  {
    "name": "Kim Xá",
    "type": "xa",
    "slug": "kim-xa",
    "name_with_type": "Xã Kim Xá",
    "path": "Kim Xá, Vĩnh Tường, Vĩnh Phúc",
    "path_with_type": "Xã Kim Xá, Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc",
    "code": "09079",
    "parent_code": "252"
  },
  {
    "name": "Lãng Công",
    "type": "xa",
    "slug": "lang-cong",
    "name_with_type": "Xã Lãng Công",
    "path": "Lãng Công, Sông Lô, Vĩnh Phúc",
    "path_with_type": "Xã Lãng Công, Huyện Sông Lô, Tỉnh Vĩnh Phúc",
    "code": "08773",
    "parent_code": "253"
  },
  {
    "name": "Quang Yên",
    "type": "xa",
    "slug": "quang-yen",
    "name_with_type": "Xã Quang Yên",
    "path": "Quang Yên, Sông Lô, Vĩnh Phúc",
    "path_with_type": "Xã Quang Yên, Huyện Sông Lô, Tỉnh Vĩnh Phúc",
    "code": "08776",
    "parent_code": "253"
  },
  {
    "name": "Đông Thành",
    "type": "phuong",
    "slug": "dong-thanh",
    "name_with_type": "Phường Đông Thành",
    "path": "Đông Thành, Ninh Bình, Ninh Bình",
    "path_with_type": "Phường Đông Thành, Thành phố Ninh Bình, Tỉnh Ninh Bình",
    "code": "14320",
    "parent_code": "369"
  },
  {
    "name": "Tân Thành",
    "type": "phuong",
    "slug": "tan-thanh",
    "name_with_type": "Phường Tân Thành",
    "path": "Tân Thành, Ninh Bình, Ninh Bình",
    "path_with_type": "Phường Tân Thành, Thành phố Ninh Bình, Tỉnh Ninh Bình",
    "code": "14323",
    "parent_code": "369"
  },
  {
    "name": "Bắc Sơn",
    "type": "phuong",
    "slug": "bac-son",
    "name_with_type": "Phường Bắc Sơn",
    "path": "Bắc Sơn, Tam Điệp, Ninh Bình",
    "path_with_type": "Phường Bắc Sơn, Thành phố Tam Điệp, Tỉnh Ninh Bình",
    "code": "14362",
    "parent_code": "370"
  },
  {
    "name": "Trung Sơn",
    "type": "phuong",
    "slug": "trung-son",
    "name_with_type": "Phường Trung Sơn",
    "path": "Trung Sơn, Tam Điệp, Ninh Bình",
    "path_with_type": "Phường Trung Sơn, Thành phố Tam Điệp, Tỉnh Ninh Bình",
    "code": "14365",
    "parent_code": "370"
  },
];
