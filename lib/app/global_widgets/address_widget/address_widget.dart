// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle { oneColumn, twoColumn }

enum WidgetMapping {
  title,
  menu,
  label_street,
  label_town,
  label_postcode,
  label_city,
  label_district,
  label_ward,
  field_street,
  field_town,
  field_postcode,
  field_city,
  field_district,
  field_ward,
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    this.tagController,
    required this.titlePadding,
    required this.labelWidth,
    required this.labelHeight,
    required this.fieldWidth,
    required this.fieldHeight,
    required this.childPadding,
    required this.titleText,
    required this.streetLabelText,
    required this.townLabelText,
    required this.postCodeLabelText,
    required this.cityLabelText,
    required this.districtLabelText,
    required this.wardLabelText,
    required this.streetHintText,
    required this.townHint,
    required this.postCodeHintText,
    required this.cityHintText,
    required this.districtHintText,
    required this.wardHint,
    this.jsonOutput,
    this.width,
    this.height,
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
  final String? tagController;
  final String titleText;
  final EdgeInsetsGeometry? titlePadding;
  final double? labelWidth;
  final double? labelHeight;
  final double? fieldWidth;
  final double? fieldHeight;
  final EdgeInsetsGeometry? childPadding;
  final String streetLabelText;
  final String postCodeLabelText;
  final String cityLabelText;
  final String districtLabelText;
  final String wardLabelText;
  final String townLabelText;
  final String streetHintText;
  final String postCodeHintText;
  final String cityHintText;
  final String districtHintText;
  final String wardHint;
  final String townHint;
  final TextEditingController? jsonOutput;
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

  @override
  // ignore: overridden_fields
  String? get tag => tagController;

  void _addListener(
      FocusNode streetNode,
      FocusNode townNode,
      FocusNode postCodeNode,
      FocusNode cityNode,
      FocusNode districtNode,
      FocusNode wardNode) {
    streetNode.addListener(() {
      if (streetNode.hasFocus) {
        streetNode.requestFocus();
      }
      if (!streetNode.hasFocus) {
        townNode.requestFocus();
      }
    });
    townNode.addListener(() {
      if (townNode.hasFocus) {
        townNode.requestFocus();
      }
      if (!townNode.hasFocus) {
        postCodeNode.requestFocus();
      }
    });
    postCodeNode.addListener(() {
      if (!postCodeNode.hasFocus) {
        cityNode.requestFocus();
      }
      // if (postCodeNode.hasFocus) {
      //   postCodeNode.requestFocus();
      // }
    });
    cityNode.addListener(() {
      if (!cityNode.hasFocus) {
        districtNode.requestFocus();
      }
      cityNode.addListener(() {});
    });

    districtNode.addListener(() {
      if (!districtNode.hasFocus) {
        wardNode.requestFocus();
      }
    });
    wardNode.addListener(() {
      if (!districtNode.hasFocus) {
        wardNode.requestFocus();
      }
    });
  }

  Map<WidgetMapping, Widget> _mappingWidget(
      Widget titleWidget,
      Widget menu,
      Widget streetLabel,
      Widget townLabel,
      Widget postCodeLabel,
      Widget cityLabel,
      Widget districtLabel,
      Widget wardLabel,
      Widget streetTextfield,
      Widget townTextfield,
      Widget postCodeTextfield,
      Widget cityDropdown,
      Widget districtDropdown,
      Widget wardDropdown) {
    Map<WidgetMapping, Widget> map = {};
    map.putIfAbsent(WidgetMapping.title, () => titleWidget);
    map.putIfAbsent(WidgetMapping.menu, () => menu);
    map.putIfAbsent(WidgetMapping.label_street, () => streetLabel);
    map.putIfAbsent(WidgetMapping.label_town, () => townLabel);
    map.putIfAbsent(WidgetMapping.label_postcode, () => postCodeLabel);
    map.putIfAbsent(WidgetMapping.label_city, () => cityLabel);
    map.putIfAbsent(WidgetMapping.label_district, () => districtLabel);
    map.putIfAbsent(WidgetMapping.label_ward, () => wardLabel);
    map.putIfAbsent(WidgetMapping.field_street, () => streetTextfield);
    map.putIfAbsent(WidgetMapping.field_town, () => townTextfield);
    map.putIfAbsent(WidgetMapping.field_postcode, () => postCodeTextfield);
    map.putIfAbsent(WidgetMapping.field_city, () => cityDropdown);
    map.putIfAbsent(WidgetMapping.field_district, () => districtDropdown);
    map.putIfAbsent(WidgetMapping.field_ward, () => wardDropdown);
    return map;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    controller.initNow(cityHintText, districtHintText, wardHint);
    final streetNode = FocusNode();
    final townNode = FocusNode();
    final postCodeNode = FocusNode();
    final cityNode = FocusNode();
    final districtNode = FocusNode();
    final wardNode = FocusNode();
    _addListener(
        streetNode, townNode, postCodeNode, cityNode, districtNode, wardNode);

    final streetController = TextEditingController();
    final townController = TextEditingController();
    final postCodeController = TextEditingController();

    final titleWidget = Container(
      margin: titlePadding,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
    );

    final menu = _AddressMenu(
      tagController: tagController,
    );

    final streetTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: streetHintText,
      controller: streetController,
      focusNode: streetNode,
    );

    final townTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: townHint,
      controller: townController,
      focusNode: townNode,
    );

    final postCodeTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: postCodeHintText,
      controller: postCodeController,
      focusNode: postCodeNode,
      onChanged: (value) {
        controller.onChangePostcode(value);
      },
    );

    final cityDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: cityHintText,
        value: controller.selectedCity.value,
        onChanged: (Object? newValue) {
          controller.cityOnChange(newValue.toString());
        },
        focusNode: cityNode,
        items:
            controller.listCity.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    final districtDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: districtHintText,
        value: controller.selectedDistrict.value,
        onChanged: (Object? newValue) {
          controller.districtOnChange(newValue.toString());
        },
        focusNode: districtNode,
        items: controller.listDistrict
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    final wardDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: wardHint,
        value: controller.selectedWard.value,
        focusNode: wardNode,
        onChanged: (Object? newValue) {
          controller.wardOnChange(newValue.toString());
        },
        items:
            controller.listWard.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    final streetLabel = _AddressLabel(
      text: streetLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final postCodeLabel = _AddressLabel(
      text: postCodeLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final cityLabel = _AddressLabel(
      text: cityLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final districtLabel = _AddressLabel(
      text: districtLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final wardLabel = _AddressLabel(
      text: wardLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final townLabel = _AddressLabel(
      text: townLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    var map = _mappingWidget(
        titleWidget,
        menu,
        streetLabel,
        townLabel,
        postCodeLabel,
        cityLabel,
        districtLabel,
        wardLabel,
        streetTextfield,
        townTextfield,
        postCodeTextfield,
        cityDropdown,
        districtDropdown,
        wardDropdown);

    final Obx child = Obx(() {
      switch (controller.addressStyle.value) {
        case AddressStyle.oneColumn:
          return StyleOneColumn(map: map);
        case AddressStyle.twoColumn:
          return StyleTwoColumn(map: map);
        default:
          return StyleOneColumn(map: map);
      }
    });

    return Container(
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
      child: child,
    );
  }
}

class StyleOneColumn extends StatelessWidget {
  const StyleOneColumn({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<WidgetMapping, Widget> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          map[WidgetMapping.title]!,
          map[WidgetMapping.menu]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_street]!,
          map[WidgetMapping.field_street]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_town]!,
          map[WidgetMapping.field_town]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_postcode]!,
          map[WidgetMapping.field_postcode]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_city]!,
          map[WidgetMapping.field_city]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_district]!,
          map[WidgetMapping.field_district]!,
        ]),
        Row(children: [
          map[WidgetMapping.label_ward]!,
          map[WidgetMapping.field_ward]!,
        ]),
      ],
    );
  }
}

class StyleTwoColumn extends StatelessWidget {
  const StyleTwoColumn({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<WidgetMapping, Widget> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          map[WidgetMapping.title]!,
          map[WidgetMapping.menu]!,
        ]),
        Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              map[WidgetMapping.label_street]!,
              map[WidgetMapping.field_street]!,
              map[WidgetMapping.label_town]!,
              map[WidgetMapping.field_town]!,
              map[WidgetMapping.label_postcode]!,
              map[WidgetMapping.field_postcode]!,
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              map[WidgetMapping.label_city]!,
              map[WidgetMapping.field_city]!,
              map[WidgetMapping.label_district]!,
              map[WidgetMapping.field_district]!,
              map[WidgetMapping.label_ward]!,
              map[WidgetMapping.field_ward]!,
            ]),
          ],
        ),
      ],
    );
  }
}

class _AddressMenu extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const _AddressMenu({
    this.tagController,
  });

  final String? tagController;
  @override
  String? get tag => tagController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String? value) {
        switch (value) {
          case 'Hiện nhãn':
            controller.changeShowLabel();
            break;
          case 'Bố cục 2 cột':
            controller.changeStyle();
            break;

          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Hiện nhãn',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: controller.showLabel.value,
                  child: const Icon(Icons.check),
                ),
                const SizedBox(width: 5),
                const Text('Hiện nhãn'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'Bố cục 2 cột',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible:
                      controller.addressStyle.value == AddressStyle.oneColumn
                          ? false
                          : true,
                  child: const Icon(Icons.check),
                ),
                const SizedBox(width: 5),
                const Text('Bố cục 2 cột'),
              ],
            ),
          ),
        ];
      },
    );
  }
}

class _AddressTextField extends StatelessWidget {
  const _AddressTextField({
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
      ),
    );
  }
}

class _AddressDropdownButton extends StatelessWidget {
  const _AddressDropdownButton({
    Key? key,
    this.width,
    this.height,
    this.margin,
    required this.hintText,
    this.value,
    this.onChanged,
    required this.items,
    this.focusNode,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String hintText;
  final Object? value;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        isExpanded: true,
        // hint: Text(hintText),
        value: value,
        onChanged: onChanged,
        items: items,
        focusNode: focusNode,
      ),
    );
  }
}

class _AddressLabel extends GetView<AddressController> {
  const _AddressLabel({
    required this.text,
    this.width,
    this.height,
    this.margin,
    this.visible = true,
    this.tagController,
  });

  final String text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool visible;
  final String? tagController;

  @override
  // ignore: overridden_fields
  String? get tag => tagController;

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    return Obx(
      () => Visibility(
        visible: controller.showLabel.value,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

// class _AutocompleteExample extends StatelessWidget {
//   const _AutocompleteExample({
//     Key? key,
//     required this.list,
//   }) : super(key: key);

//   final List<String> list;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white),
//       ),
//       width: 260,
//       child: Autocomplete<String>(
//         optionsBuilder: (TextEditingValue textEditingValue) {
//           if (textEditingValue.text == '') {
//             return const Iterable<String>.empty();
//           }
//           return list.where((String option) {
//             return option
//                 .toLowerCase()
//                 .contains(textEditingValue.text.toLowerCase());
//           });
//         },
//         onSelected: (String selection) {
//           debugPrint('You just selected $selection');
//         },
//         fieldViewBuilder: (BuildContext context,
//             TextEditingController fieldTextEditingController,
//             FocusNode fieldFocusNode,
//             VoidCallback onFieldSubmitted) {
//           return TextField(
//             controller: fieldTextEditingController,
//             focusNode: fieldFocusNode,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           );
//         },
//         optionsViewBuilder: (
//           BuildContext context,
//           AutocompleteOnSelected<String> onSelected,
//           Iterable<String> options,
//         ) {
//           return Align(
//             alignment: Alignment.topLeft,
//             child: Material(
//               child: Container(
//                 width: 300,
//                 color: Colors.teal,
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(10.0),
//                   itemCount: options.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final String option = options.elementAt(index);

//                     return GestureDetector(
//                       onTap: () {
//                         onSelected(option);
//                       },
//                       child: ListTile(
//                         title: Text(option,
//                             style: const TextStyle(color: Colors.white)),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Obx exam = Obx(() {
//   return AutocompleteBasicExample(
//     list: controller.listCity,
//   );
// });
// Widget exam = AutocompleteBasicExample(
//   list: [
//     'Hồ Chí Minh',
//     'Hà Nội',
//     'Đà Nẵng',
//   ],
// );
// Widget exam = AutocompleteBasicExample(
//   list: controller.listCity,
// );
