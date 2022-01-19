import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class _DefaultText {
  static const String titleLabel = "Thông tin người liên hệ";
  static const String streetLabel = "Số nhà/Tên đường";
  static const String postCodeLabel = "Nhập mã địa lý hành chính";
  static const String cityLabel = "Lựa chọn Tỉnh/ Thành Phố";
  static const String districtLabel = "Lựa chọn Quận/Huyện";
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    //? Customize
    this.addressStyle = AddressStyle.oneColumn,
    this.showChangeStyleIcon = false,
    this.tagController,
    required this.jsonOutput,
    //? Basic Container
    this.width,
    this.height,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
  });

  //? Customize
  final AddressStyle addressStyle;
  final bool showChangeStyleIcon;
  final String? tagController;
  final TextEditingController jsonOutput;
  //? Basic Container
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;

  @override
  // ignore: overridden_fields
  String? get tag => tagController;

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    controller.initNow(addressStyle);
    const EdgeInsets defaultMargin = EdgeInsets.all(5);
    Widget header = Container(
      margin: defaultMargin,
      child: const Text(
        _DefaultText.titleLabel,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Container streetTextfield = Container(
      margin: defaultMargin,
      width: 220,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: _DefaultText.streetLabel,
        ),
      ),
    );

    Container postCodeTextfield = Container(
      margin: defaultMargin,
      width: 220,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: _DefaultText.postCodeLabel,
        ),
      ),
    );

    Obx cityDropdown = Obx(
      () => Container(
        width: 220,
        margin: defaultMargin,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          isExpanded: true,
          hint: const Text(_DefaultText.cityLabel),
          value: controller.selectedCity.value,
          onChanged: (String? newValue) {
            controller.cityOnChange(newValue);
          },
          items:
              controller.listCity.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );

    Obx districtDropdown = Obx(
      () => Container(
        width: 220,
        margin: defaultMargin,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          isExpanded: true,
          hint: const Text(_DefaultText.districtLabel),
          value: controller.selectedDistrict.value,
          onChanged: (String? newValue) {
            controller.districtOnChange(newValue);
          },
          items: controller.listDistrict
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );

    Widget oneColumnStyle = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              streetTextfield,
              postCodeTextfield,
              cityDropdown,
              districtDropdown,
            ],
          ),
        ],
      ),
    );
    Widget twoColumnStyle = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              streetTextfield,
              postCodeTextfield,
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cityDropdown,
              districtDropdown,
            ],
          ),
        ],
      ),
    );
    Obx body = Obx(() {
      switch (controller.addressStyle.value!) {
        case AddressStyle.oneColumn:
          return oneColumnStyle;
        case AddressStyle.twoColumn:
          return twoColumnStyle;
      }
    });

    Widget footer = Visibility(
      visible: showChangeStyleIcon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            iconSize: 40,
            onPressed: () => controller.changeStyle(),
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
    );
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          header,
          body,
          footer,
        ],
      ),
    );
  }
}
