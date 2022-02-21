import 'package:flutter/material.dart';

/// [AddressTextField] is customize TextField of Flutter
class AddressTextField extends StatelessWidget {
  const AddressTextField({
    Key? key,
    this.childPadding,
    this.width,
    this.height,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  final EdgeInsetsGeometry? childPadding;
  final double? width;
  final double? height;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: childPadding,
      width: width,
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
        ),
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        onSaved: onSaved,
      ),
    );
  }
}
