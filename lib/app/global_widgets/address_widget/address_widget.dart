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
    this.child,
    this.mainAxisAlignmentRow = MainAxisAlignment.center,
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

  //? Customize
  final Widget? title;
  final List<Widget>? child;
  final MainAxisAlignment mainAxisAlignmentRow;
  final AddressStyle addressStyle;
  final bool showChangeStyleIcon;
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title ?? const SizedBox(),
      ],
    );
  }

  Widget _buildBody() {
    switch (controller.addressStyle.value) {
      case AddressStyle.oneColumn:
        return OneColumnWidget(
          child: child ?? [const SizedBox()],
        );
      case AddressStyle.twoColumn:
        return TwoColumnWidget(
          child: child ?? [const SizedBox()],
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
    return Obx(() => Container(
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
        ));
  }
}

class TwoColumnWidget extends StatelessWidget {
  const TwoColumnWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    List<Widget> left = [];
    List<Widget> right = [];
    bool isLeft = true;
    for (var element in child) {
      if (isLeft) {
        left.add(element);
        isLeft = !isLeft;
      } else {
        right.add(element);
        isLeft = !isLeft;
      }
    }
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: left,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: right,
          ),
        ],
      ),
    );
  }
}

class OneColumnWidget extends StatelessWidget {
  const OneColumnWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final List<Widget> child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: child,
          ),
        ],
      ),
    );
  }
}
