import 'package:flutter/material.dart';

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
    this.thirdChild,
    this.fourthChild,
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
  final Widget? thirdChild;
  final Widget? fourthChild;
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
    if (customeStyle == AddressStyle.row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstChild,
          secondChild,
        ],
      );
    } else {
      return Column(
        children: [
          firstChild,
          secondChild,
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
