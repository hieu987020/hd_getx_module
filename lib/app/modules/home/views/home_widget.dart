import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/modules/home/controllers/address_controller.dart';

enum AddressStyle {
  row,
  column,
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    this.width,
    this.height,
    required this.firstChild,
    required this.secondChild,
    required this.thirdChild,
    required this.fourthChild,
    this.customeStyle = AddressStyle.row,
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
  }) : super(key: key);
  final Widget firstChild;
  final Widget secondChild;
  final Widget thirdChild;
  final Widget fourthChild;
  final AddressStyle customeStyle;

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

  Widget _buildChild() {
    var controller = Get.put(AddressController());
    if (controller.addressStyle.value == AddressStyle.row) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              firstChild,
              secondChild,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              thirdChild,
              fourthChild,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _changeStyleButton(),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          firstChild,
          secondChild,
          thirdChild,
          fourthChild,
          _changeStyleButton(),
        ],
      );
    }
  }

  Widget _changeStyleButton() {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          Get.find<AddressController>().changeStyle();
        },
        icon: const Icon(Icons.change_circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: _buildChild(),
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
        ));
  }
}
