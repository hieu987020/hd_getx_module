import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  AddressWidget({
    this.width,
    this.height,
    this.title,
    this.child,
    this.mainAxisAlignmentRow = MainAxisAlignment.center,
    this.addressStyle = AddressStyle.oneColumn,
    this.showChangeStyleIcon = false,
    this.tagController,
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
  final Widget? title;
  final List<Widget>? child;
  final MainAxisAlignment mainAxisAlignmentRow;
  final AddressStyle addressStyle;
  final bool showChangeStyleIcon;
  final String? tagController;
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title ?? const SizedBox(),
      ],
    );
  }

  Container streetTextfield = Container(
    margin: const EdgeInsets.all(5),
    width: 120,
    child: const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Số nhà/Tên đường',
      ),
    ),
  );
  Container postCodeTextfield = Container(
    margin: const EdgeInsets.all(5),
    width: 120,
    child: const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nhập mã địa lý hành chính',
      ),
    ),
  );

  String? initialValue;
  Obx cityDropdown() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(5),
        child: DropdownButton(
          hint: const Text('Lựa chọn Tỉnh/ Thành Phố'),
          value: controller.selectedCity.value == ''
              ? initialValue
              : controller.selectedCity.value,
          onChanged: (String? newValue) {
            controller.selectedCity(newValue);
            controller.fetchDistricts();
            controller.selectedDistrict('');
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
  }

  Obx districtDropdown() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(5),
        child: DropdownButton(
          hint: const Text('Lựa chọn Quận/Huyện'),
          value: controller.selectedDistrict.value == ''
              ? initialValue
              : controller.selectedDistrict.value,
          onChanged: (String? newValue) {
            controller.selectedDistrict(newValue);
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
  }

  Widget _buildBody() {
    switch (controller.addressStyle.value) {
      case AddressStyle.oneColumn:
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  streetTextfield,
                  postCodeTextfield,
                  cityDropdown(),
                  districtDropdown(),
                ],
              ),
            ],
          ),
        );
      case AddressStyle.twoColumn:
        return Expanded(
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
                  cityDropdown(),
                  districtDropdown(),
                ],
              ),
            ],
          ),
        );

      default:
        return const SizedBox();
    }
  }

  Widget _buildFooter() {
    return Visibility(
      visible: showChangeStyleIcon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            iconSize: 40,
            onPressed: () => controller.changeStyle(),
            // controller.changeStyle()
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    controller.initNow();
    return Obx(
      () => Container(
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
            _buildHeader(),
            _buildBody(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }
}
