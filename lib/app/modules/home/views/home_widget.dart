import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/modules/home/controllers/address_controller.dart';

enum AddressStyle {
  row,
  column,
}

class AddressWidget extends StatelessWidget {
  AddressWidget({
    Key? key,
    this.width,
    this.height,
    required this.firstChild,
    required this.secondChild,
    required this.thirdChild,
    required this.fourthChild,
    required this.fifthChild,
    required this.sixthChild,
    this.addressStyle = AddressStyle.row,
    this.showChangeStyleIcon = false,
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

  //? customize
  final Widget firstChild;
  final Widget secondChild;
  final Widget thirdChild;
  final Widget fourthChild;
  final Widget fifthChild;
  final Widget sixthChild;
  final AddressStyle addressStyle;

  final bool showChangeStyleIcon;

  //? basic container
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

  final controller = Get.put(AddressController());

  Widget _buildChild() {
    if (controller.addressStyle.value == AddressStyle.row) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              firstChild,
              secondChild,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              thirdChild,
              fourthChild,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              fifthChild,
              sixthChild,
            ],
          ),
          (showChangeStyleIcon) ? _changeStyleButton() : const SizedBox(),
        ],
      );
    } else {
      return Column(
        children: [
          firstChild,
          secondChild,
          thirdChild,
          fourthChild,
          fifthChild,
          sixthChild,
          (showChangeStyleIcon) ? _changeStyleButton() : const SizedBox(),
        ],
      );
    }
  }

  Widget _changeStyleButton() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              width: 60,
              height: 60,
              child: IconButton(
                onPressed: () {
                  Get.find<AddressController>().changeStyle();
                },
                icon: const Center(
                  child: Icon(
                    Icons.change_circle,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
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
