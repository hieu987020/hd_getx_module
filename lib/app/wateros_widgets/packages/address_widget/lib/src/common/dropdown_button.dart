// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

/// [AddressDropdownButton] is customize DropdownButton widget of FLutter
class AddressDropdownButton extends GetView<AddressController> {
  const AddressDropdownButton({
    required this.type,
    this.tagController,
    this.width,
    this.height,
    this.margin,
    this.value,
    this.onChanged,
    this.focusNode,
    this.onTap,
  });

  final String type;
  final String? tagController;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Object? value;
  final void Function(Object?)? onChanged;
  final FocusNode? focusNode;
  final void Function()? onTap;

  @override
  // ignore: overridden_fields
  String? get tag => tagController;

  @override
  Widget build(BuildContext context) {
    // Get controller
    Get.put(AddressController(), tag: tagController);

    RxList<String> listString;
    RxString selectedValue = RxString('');
    switch (type) {
      case 'city':
        listString = controller.cityItems;
        selectedValue = controller.selectedCityItem;
        break;
      case 'district':
        listString = controller.districtItems;
        selectedValue = controller.selectedDistrictItem;
        break;
      case 'ward':
        listString = controller.wardItems;
        selectedValue = controller.selectedWardItem;
        break;
      default:
        listString = controller.cityItems;
    }

    return Obx(() {
      return Container(
        width: width,
        height: height,
        margin: margin,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          isExpanded: true,
          value: selectedValue,
          onChanged: onChanged,
          items: listString.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          focusNode: focusNode,
          onTap: () => focusNode!.requestFocus(),
        ),
      );
    });
  }
}
