// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum LayoutMode {
  oneColumn,
  twoColumn,
}

enum WidgetMapping {
  title,
  menu,
  labelStreet,
  labelTown,
  labelPostcode,
  labelCity,
  labelDistrict,
  labelWard,
  fieldStreet,
  fieldTown,
  fieldPostcode,
  fieldCity,
  fieldDistrict,
  fieldWard,
  example,
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
    streetNode.onKey = ((streetNode, RawKeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        postCodeNode.requestFocus();
        return KeyEventResult.handled;
      }

      return KeyEventResult.ignored;
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
      Widget wardDropdown,
      Widget example) {
    Map<WidgetMapping, Widget> map = {};
    map.putIfAbsent(WidgetMapping.title, () => titleWidget);
    map.putIfAbsent(WidgetMapping.menu, () => menu);
    map.putIfAbsent(WidgetMapping.labelStreet, () => streetLabel);
    map.putIfAbsent(WidgetMapping.labelTown, () => townLabel);
    map.putIfAbsent(WidgetMapping.labelPostcode, () => postCodeLabel);
    map.putIfAbsent(WidgetMapping.labelCity, () => cityLabel);
    map.putIfAbsent(WidgetMapping.labelDistrict, () => districtLabel);
    map.putIfAbsent(WidgetMapping.labelWard, () => wardLabel);
    map.putIfAbsent(WidgetMapping.fieldStreet, () => streetTextfield);
    map.putIfAbsent(WidgetMapping.fieldTown, () => townTextfield);
    map.putIfAbsent(WidgetMapping.fieldPostcode, () => postCodeTextfield);
    map.putIfAbsent(WidgetMapping.fieldCity, () => cityDropdown);
    map.putIfAbsent(WidgetMapping.fieldDistrict, () => districtDropdown);
    map.putIfAbsent(WidgetMapping.fieldWard, () => wardDropdown);
    map.putIfAbsent(WidgetMapping.example, () => example);
    return map;
  }

  @override
  Widget build(BuildContext context) {
    // Get controller
    Get.put(AddressController(), tag: tagController);

    // Init data
    controller.initValue(cityHintText, districtHintText, wardHint);

    // FocusNode
    FocusNode streetNode = FocusNode();
    FocusNode townNode = FocusNode();
    FocusNode postCodeNode = FocusNode();
    FocusNode cityNode = FocusNode();
    FocusNode districtNode = FocusNode();
    FocusNode wardNode = FocusNode();

    // Add listender
    _addListener(
      streetNode,
      townNode,
      postCodeNode,
      cityNode,
      districtNode,
      wardNode,
    );

    // Create TextEdittingController
    final TextEditingController streetController = TextEditingController();
    final TextEditingController townController = TextEditingController();
    final TextEditingController postCodeController = TextEditingController();

    // Title Widget
    final Container titleWidget = Container(
        margin: titlePadding,
        child: Text(titleText, style: Theme.of(context).textTheme.headline4));

    // Menu Widget
    final _AddressMenu menu = _AddressMenu(tagController: tagController);

    // Textfield : Street
    final _AddressTextField streetTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: streetHintText,
      controller: streetController,
      focusNode: streetNode,
      // onFieldSubmitted: (value) => townNode.requestFocus(),
    );

    // Textfield : Town
    final _AddressTextField townTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: townHint,
      controller: townController,
      focusNode: townNode,
      // onFieldSubmitted: (value) => postCodeNode.requestFocus(),
    );

    // Textfield : Postcode
    final _AddressTextField postCodeTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: postCodeHintText,
      controller: postCodeController,
      focusNode: postCodeNode,
      onChanged: (value) => controller.onChangePostcode(value),
      // onFieldSubmitted: (value) => cityNode.requestFocus(),
    );

    // DropdownButton : City
    final Obx cityDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        value: controller.selectedCityItem.value,
        onChanged: (newValue) async {
          postCodeController.text =
              await controller.cityOnChange(newValue.toString());
        },
        focusNode: cityNode,
        items:
            controller.cityItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onTap: () => cityNode.requestFocus(),
      );
    });

    // DropdownButton : District
    final Obx districtDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        value: controller.selectedDistrictItem.value,
        onChanged: (newValue) async {
          postCodeController.text =
              await controller.districtOnChange(newValue.toString());
        },
        focusNode: districtNode,
        items: controller.districtItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onTap: () => districtNode.requestFocus(),
      );
    });

    // DropdownButton : Ward
    final Obx wardDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        value: controller.selectedWardItem.value,
        focusNode: wardNode,
        onChanged: (newValue) async {
          postCodeController.text =
              await controller.wardOnChange(newValue.toString());
        },
        items:
            controller.wardItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onTap: () => wardNode.requestFocus(),
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

    final _AutocompleteExample example = _AutocompleteExample(
      items: controller.cityItems,
      width: fieldWidth,
      height: fieldHeight,
      margin: childPadding,
      onSelected: (newValue) async {
        postCodeController.text =
            await controller.cityOnChange(newValue.toString());
      },
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
      wardDropdown,
      example,
    );

    final Obx child = Obx(() {
      switch (controller.layoutMode.value) {
        case LayoutMode.oneColumn:
          return StyleOneColumn(map: map);
        case LayoutMode.twoColumn:
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
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            map[WidgetMapping.title]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(1),
              child: map[WidgetMapping.menu]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelStreet]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(2),
              child: map[WidgetMapping.fieldStreet]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelTown]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(3),
              child: map[WidgetMapping.fieldTown]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelPostcode]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(4),
              child: map[WidgetMapping.fieldPostcode]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelCity]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(5),
              child: map[WidgetMapping.example]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelDistrict]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(6),
              child: map[WidgetMapping.fieldDistrict]!,
            ),
          ]),
          Row(children: [
            map[WidgetMapping.labelWard]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(7),
              child: map[WidgetMapping.fieldWard]!,
            ),
          ]),
        ],
      ),
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
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            map[WidgetMapping.title]!,
            FocusTraversalOrder(
              order: const NumericFocusOrder(1),
              child: map[WidgetMapping.menu]!,
            ),
          ]),
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                map[WidgetMapping.labelStreet]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(2),
                  child: map[WidgetMapping.fieldStreet]!,
                ),
                map[WidgetMapping.labelTown]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(3),
                  child: map[WidgetMapping.fieldTown]!,
                ),
                map[WidgetMapping.labelPostcode]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(4),
                  child: map[WidgetMapping.fieldPostcode]!,
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                map[WidgetMapping.labelCity]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(5),
                  child: map[WidgetMapping.fieldCity]!,
                ),
                map[WidgetMapping.labelDistrict]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(6),
                  child: map[WidgetMapping.fieldDistrict]!,
                ),
                map[WidgetMapping.labelWard]!,
                FocusTraversalOrder(
                  order: const NumericFocusOrder(7),
                  child: map[WidgetMapping.fieldWard]!,
                ),
              ]),
            ],
          ),
        ],
      ),
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
            controller.showLabel();
            break;
          case 'Bố cục 2 cột':
            if (controller.layoutMode.value == LayoutMode.oneColumn) {
              controller.changeLayoutMode(LayoutMode.twoColumn);
            } else {
              controller.changeLayoutMode(LayoutMode.oneColumn);
            }
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
                  visible: controller.labelEnable.value,
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
                  visible: controller.layoutMode.value == LayoutMode.oneColumn
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

class _AddressDropdownButton extends StatelessWidget {
  const _AddressDropdownButton({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.value,
    this.onChanged,
    required this.items,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Object? value;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final FocusNode? focusNode;
  final void Function()? onTap;
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
        value: value,
        onChanged: onChanged,
        items: items,
        focusNode: focusNode,
        onTap: onTap,
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
        visible: controller.labelEnable.value,
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

class _AutocompleteExample extends StatelessWidget {
  const _AutocompleteExample({
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
        // initialValue: ,
      ),
    );
  }
}
