// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class DefaultText {
  static const LABEL_TITLE = "Thông tin người liên hệ";
  static const LABEL_STREET = "Nhập Số nhà/Tên đường";
  static const LABEL_POSTCODE = "Nhập mã địa lý hành chính";
  static const LABEL_CITY = "Lựa chọn Tỉnh/ Thành Phố";
  static const LABEL_DISTRICT = "Lựa chọn Quận/Huyện";
  static const LABEL_WARD = "Lựa chọn Xã/Phường/Thị trấn";
  static const LABEL_TOWN = "Lựa chọn Thôn/Ấp/Khu phố";
  static const HINT_STREET = "Số nhà/ Tên đường:(*)";
  static const HINT_TOWN = "Thôn/Ấp/Khu phố:";
  static const HINT_POSTCODE = "Mã Tĩnh/Quận/Xã:";
  static const HINT_CITY = "Tỉnh/Thành phố:(*)";
  static const HINT_DISTRICT = "Quận/Huyện:(*)";
  static const HINT_WARD = "Xã/Phường/Thị trấn:(*)";

  static const MAP_TITLE = 'title';
  static const MAP_MENU = 'menu';
  static const MAP_LABEL_STREET = 'label_street';
  static const MAP_LABEL_TOWN = 'label_town';
  static const MAP_LABEL_POSTCODE = 'label_postcode';
  static const MAP_LABEL_CITY = 'label_city';
  static const MAP_LABEL_DISTRICT = 'label_district';
  static const MAP_LABEL_WARD = 'label_ward';
  static const MAP_TEXTFIELD_STREET = 'textfield_street';
  static const MAP_TEXTFIELD_TOWN = 'textfield_town';
  static const MAP_TEXTFIELD_POSTCODE = 'textfield_postcode';
  static const MAP_DROPDOWN_CITY = 'dtopdown_city';
  static const MAP_DROPDOWN_DISTRICT = 'dtopdown_district';
  static const MAP_DROPDOWN_WARD = 'dtopdown_ward';
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    this.titleText = DefaultText.LABEL_TITLE,
    this.titlePadding = const EdgeInsets.all(20),
    this.labelWidth = 200,
    this.labelHeight = 30,
    this.fieldWidth = 300,
    this.fieldHeight = 60,
    this.childPadding = const EdgeInsets.all(5),
    this.streetLabelText = DefaultText.HINT_STREET,
    this.postCodeLabelText = DefaultText.HINT_POSTCODE,
    this.cityLabelText = DefaultText.HINT_CITY,
    this.districtLabelText = DefaultText.HINT_DISTRICT,
    this.wardLabelText = DefaultText.HINT_WARD,
    this.townLabelText = DefaultText.HINT_TOWN,
    this.streetHintText = DefaultText.LABEL_STREET,
    this.postCodeHintText = DefaultText.LABEL_POSTCODE,
    this.cityHintText = DefaultText.LABEL_CITY,
    this.districtHintText = DefaultText.LABEL_DISTRICT,
    this.wardHint = DefaultText.LABEL_WARD,
    this.townHint = DefaultText.LABEL_TOWN,
    this.tagController,
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
  final String? tagController;
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

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController(), tag: tagController);
    controller.initNow();

    final Container titleWidget = Container(
      margin: titlePadding,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
    );

    final _AddressMenu menu = _AddressMenu(
      tagController: tagController,
    );

    final TextEditingController streetController = TextEditingController();

    FocusNode streetFocus = FocusNode();
    FocusNode townFocus = FocusNode();
    FocusNode postCodeFocus = FocusNode();
    FocusNode cityFocus = FocusNode();
    FocusNode districtFocus = FocusNode();
    FocusNode wardFocus = FocusNode();
    final _AddressTextField streetTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: streetHintText,
      controller: streetController,
      focusNode: streetFocus,
      onEditingComplete: () {
        if (streetFocus.hasFocus) {
          print('co focus');
        }
        townFocus.requestFocus();
      },
    );

    final TextEditingController townController = TextEditingController();

    final _AddressTextField townTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: townHint,
      controller: townController,
      focusNode: townFocus,
      onEditingComplete: () {
        postCodeFocus.requestFocus();
      },
    );

    final TextEditingController postCodeController = TextEditingController();

    final _AddressTextField postCodeTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: postCodeHintText,
      controller: postCodeController,
      focusNode: postCodeFocus,
      onEditingComplete: () {
        cityFocus.requestFocus();
      },
    );

    final Obx cityDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: cityHintText,
        value: controller.selectedCity.value,
        onChanged: (Object? newValue) {
          controller.cityOnChange(newValue.toString());
        },
        focusNode: cityFocus,
        items:
            controller.listCity.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    final Obx districtDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: districtHintText,
        value: controller.selectedDistrict.value,
        onChanged: (Object? newValue) {
          controller.districtOnChange(newValue.toString());
        },
        items: controller.listDistrict
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    final Obx wardDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: wardHint,
        value: controller.selectedWard.value,
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

    final _AddressLabel streetLabel = _AddressLabel(
      text: streetLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final _AddressLabel postCodeLabel = _AddressLabel(
      text: postCodeLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final _AddressLabel cityLabel = _AddressLabel(
      text: cityLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final _AddressLabel districtLabel = _AddressLabel(
      text: districtLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final _AddressLabel wardLabel = _AddressLabel(
      text: wardLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final _AddressLabel townLabel = _AddressLabel(
      text: townLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final Map<String, Widget> map = {};
    map.putIfAbsent(DefaultText.MAP_TITLE, () => titleWidget);
    map.putIfAbsent(DefaultText.MAP_MENU, () => menu);
    map.putIfAbsent(DefaultText.MAP_LABEL_STREET, () => streetLabel);
    map.putIfAbsent(DefaultText.MAP_LABEL_TOWN, () => townLabel);
    map.putIfAbsent(DefaultText.MAP_LABEL_POSTCODE, () => postCodeLabel);
    map.putIfAbsent(DefaultText.MAP_LABEL_CITY, () => cityLabel);
    map.putIfAbsent(DefaultText.MAP_LABEL_DISTRICT, () => districtLabel);
    map.putIfAbsent(DefaultText.MAP_LABEL_WARD, () => wardLabel);
    map.putIfAbsent(DefaultText.MAP_TEXTFIELD_STREET, () => streetTextfield);
    map.putIfAbsent(DefaultText.MAP_TEXTFIELD_TOWN, () => townTextfield);
    map.putIfAbsent(
        DefaultText.MAP_TEXTFIELD_POSTCODE, () => postCodeTextfield);
    map.putIfAbsent(DefaultText.MAP_DROPDOWN_CITY, () => cityDropdown);
    map.putIfAbsent(DefaultText.MAP_DROPDOWN_DISTRICT, () => districtDropdown);
    map.putIfAbsent(DefaultText.MAP_DROPDOWN_WARD, () => wardDropdown);

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

  final Map<String, Widget> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          map[DefaultText.MAP_TITLE]!,
          map[DefaultText.MAP_MENU]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_STREET]!,
          map[DefaultText.MAP_TEXTFIELD_STREET]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_TOWN]!,
          map[DefaultText.MAP_TEXTFIELD_TOWN]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_POSTCODE]!,
          map[DefaultText.MAP_TEXTFIELD_POSTCODE]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_CITY]!,
          map[DefaultText.MAP_DROPDOWN_CITY]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_DISTRICT]!,
          map[DefaultText.MAP_DROPDOWN_DISTRICT]!,
        ]),
        Row(children: [
          map[DefaultText.MAP_LABEL_WARD]!,
          map[DefaultText.MAP_DROPDOWN_WARD]!,
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

  final Map<String, Widget> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          map[DefaultText.MAP_TITLE]!,
          map[DefaultText.MAP_MENU]!,
        ]),
        Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              map[DefaultText.MAP_LABEL_STREET]!,
              map[DefaultText.MAP_TEXTFIELD_STREET]!,
              map[DefaultText.MAP_LABEL_TOWN]!,
              map[DefaultText.MAP_TEXTFIELD_TOWN]!,
              map[DefaultText.MAP_LABEL_POSTCODE]!,
              map[DefaultText.MAP_TEXTFIELD_POSTCODE]!,
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              map[DefaultText.MAP_LABEL_CITY]!,
              map[DefaultText.MAP_DROPDOWN_CITY]!,
              map[DefaultText.MAP_LABEL_DISTRICT]!,
              map[DefaultText.MAP_DROPDOWN_DISTRICT]!,
              map[DefaultText.MAP_LABEL_WARD]!,
              map[DefaultText.MAP_DROPDOWN_WARD]!,
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
            controller.postCodeSubmit('37');
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
        hint: Text(hintText),
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
//             return option.contains(textEditingValue.text);
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
