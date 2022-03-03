import 'package:flutter/material.dart';

/// [AddressDropdownButton] is customize DropdownButton widget of FLutter
class AddressDropdownButton extends StatelessWidget {
  const AddressDropdownButton({
    Key? key,
    required this.type,
    this.tagController,
    this.width,
    this.height,
    this.margin,
    this.value,
    this.items,
    this.onChanged,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  final String type;
  final String? tagController;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final FocusNode? focusNode;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        isExpanded: true,
        value: value,
        onChanged: onChanged,
        items: items,
        focusNode: focusNode,
        onTap: () => focusNode!.requestFocus(),
      ),
    );
  }
}
