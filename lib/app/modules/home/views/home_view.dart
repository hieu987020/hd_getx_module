// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/data/repositories/repositories.dart';
import 'package:hd_getx_module/app/data/services/address_service.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

const titleText = "Thông tin người liên hệ";
const streetHintText = "Nhập Số nhà/Tên đường";
const townHint = "Lựa chọn Thôn/Ấp/Khu phố";
const postCodeHintText = "Nhập mã địa lý hành chính";
const cityHintText = "Lựa chọn Tỉnh/ Thành Phố";
const districtHintText = "Lựa chọn Quận/Huyện";
const wardHint = "Lựa chọn Xã/Phường/Thị trấn";
const streetLabelText = "Số nhà/ Tên đường:(*)";
const townLabelText = "Thôn/Ấp/Khu phố:";
const postCodeLabelText = "Mã Tĩnh/Quận/Xã:";
const cityLabelText = "Tỉnh/Thành phố:(*)";
const districtLabelText = "Quận/Huyện:(*)";
const wardLabelText = "Xã/Phường/Thị trấn:(*)";

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              AddressWidget(
                tagController: 'tag1',
                width: 650,
                height: 450,
                labelWidth: 200,
                labelHeight: 30,
                fieldWidth: 300,
                fieldHeight: 60,
                color: Colors.black,
                titlePadding: const EdgeInsets.all(20),
                childPadding: const EdgeInsets.symmetric(horizontal: 10),
                titleText: titleText,
                streetLabelText: streetLabelText,
                townLabelText: townLabelText,
                postCodeLabelText: postCodeLabelText,
                cityLabelText: cityLabelText,
                districtLabelText: districtLabelText,
                wardLabelText: wardLabelText,
                streetHintText: streetHintText,
                townHintText: townHint,
                postCodeHintText: postCodeHintText,
                cityHintText: cityHintText,
                districtHintText: districtHintText,
                wardHintText: wardHint,
                dataProvider: ({
                  addressFilter,
                  name,
                  hintText,
                  postcode,
                }) {
                  return AddressService(
                    cityRepository: CityRepository(),
                    districtRepository: DistrictRepository(),
                    wardRepository: WardRepository(),
                  ).serviceFunction(
                    addressFilter: addressFilter,
                    name: name,
                    hintText: hintText,
                    postcode: postcode,
                  );
                },
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (_) => AlertDialog(
              //                 title: const Text('Địa chỉ của bạn'),
              //                 content: Text(output.text),
              //               ));
              //     },
              //     child: const Text('Show output')),
              // const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
