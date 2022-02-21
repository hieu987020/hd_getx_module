import 'package:flutter/material.dart';

class AutocompleteExample extends StatelessWidget {
  const AutocompleteExample({
    Key? key,
    this.width,
    this.height,
    this.margin,
    required this.items,
    this.onSelected,
  }) : super(key: key);
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final List<String> items;
  final void Function(String)? onSelected;
  @override
  Widget build(BuildContext context) {
    TextEditingValue defaultValue = const TextEditingValue(text: 'a');
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Autocomplete<String>(
        // displayStringForOption: _displayStringForOption,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return items.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          }
          return items.where((String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: onSelected,
        initialValue: defaultValue,
      ),
    );
  }
}
