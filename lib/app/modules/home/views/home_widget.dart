import 'package:flutter/material.dart';

enum CustomeStyle {
  row,
  column,
}

class CustomeWidget extends StatelessWidget {
  const CustomeWidget({
    Key? key,
    this.width,
    this.height,
    this.firstChild,
    this.secondChild,
    this.customeStyle = CustomeStyle.row,
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
  final Widget? firstChild;
  final Widget? secondChild;
  final CustomeStyle customeStyle;

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

  Widget _buildStyle() {
    if (customeStyle == CustomeStyle.row) {
      return Row(
        children: [
          firstChild ?? const SizedBox(),
          secondChild ?? const SizedBox(),
        ],
      );
    } else {
      return Column(
        children: [
          firstChild ?? const SizedBox(),
          secondChild ?? const SizedBox(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildStyle(),
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
