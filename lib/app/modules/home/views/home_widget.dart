import 'package:flutter/material.dart';

enum CustomeStyle {
  row,
  column,
}

class CustomeWidget extends StatelessWidget {
  const CustomeWidget({
    Key? key,
    this.firstChild,
    this.secondChild,
    this.customeStyle = CustomeStyle.row,
    this.icon,
  }) : super(key: key);

  final Widget? firstChild;
  final Widget? secondChild;
  final CustomeStyle customeStyle;
  final Widget? icon;

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
    );
  }
}
