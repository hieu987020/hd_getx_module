// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

/// [AddressLabel] is label of all field
class AddressLabel extends GetView<AddressController> {
  const AddressLabel({
    required this.text,
    this.width,
    this.height,
    this.margin,
    this.visible = true,
    this.tagController,
  });

  final String text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool visible;
  final String? tagController;

  @override
  // ignore: overridden_fields
  String? get tag => tagController;

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    return Obx(
      () => Visibility(
        visible: controller.labelEnable.value,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
