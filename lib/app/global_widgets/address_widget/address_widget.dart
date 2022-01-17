import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    this.width,
    this.height,
    this.title,
    required this.firstChild,
    required this.secondChild,
    required this.thirdChild,
    required this.fourthChild,
    required this.fifthChild,
    required this.sixthChild,
    this.addressStyle = AddressStyle.oneColumn,
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
  });

  //? customize
  final Widget? title;
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

  Widget buildChild() {
    switch (controller.addressStyle.value) {
      case AddressStyle.oneColumn:
        return buildLayout(oneColumnStyle());
      case AddressStyle.twoColumn:
        return buildLayout(twoColumnStyle());
      default:
        return const SizedBox();
    }
  }

  Widget buildLayout(Widget widget) {
    return Column(
      children: [
        title ?? const SizedBox(),
        widget,
        changeStyleButton(),
      ],
    );
  }

  Widget oneColumnStyle() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              firstChild,
              secondChild,
              thirdChild,
              fourthChild,
              fifthChild,
              sixthChild,
            ],
          ),
        ],
      ),
    );
  }

  Widget twoColumnStyle() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [firstChild, secondChild, thirdChild],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [fourthChild, fifthChild, sixthChild],
          ),
        ],
      ),
    );
  }

  Widget changeStyleButton() {
    return Visibility(
      visible: showChangeStyleIcon,
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
                onPressed: () => controller.changeStyle(),
                icon: const Center(child: Icon(Icons.change_circle, size: 40)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Obx(
      () => Container(
        child: buildChild(),
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
      ),
    );
  }
}
