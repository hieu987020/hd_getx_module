import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

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
    required this.townHintText,
    required this.postCodeHintText,
    required this.cityHintText,
    required this.districtHintText,
    required this.wardHintText,
    this.jsonOutput,
    this.func1,
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
  final String wardHintText;
  final String townHintText;
  final TextEditingController? jsonOutput;
  final void Function()? func1;
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
    // Get controller
    Get.put(AddressController(), tag: tagController);

    // Init data
    controller.initValue(cityHintText, districtHintText, wardHintText);

    FocusNode streetNode = FocusNode();
    FocusNode townNode = FocusNode();
    FocusNode postCodeNode = FocusNode();
    FocusNode cityNode = FocusNode();
    FocusNode districtNode = FocusNode();
    FocusNode wardNode = FocusNode();

    // Add listender
    addListener(
        streetNode, townNode, postCodeNode, cityNode, districtNode, wardNode);

    final TextEditingController streetController = TextEditingController();
    final TextEditingController townController = TextEditingController();
    final TextEditingController postCodeController = TextEditingController();

    final Container titleWidget = Container(
        margin: titlePadding,
        child: Text(titleText, style: Theme.of(context).textTheme.headline4));

    final AddressMenu menu = AddressMenu(tagController: tagController);

    final AddressTextField streetTextfield = AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: streetHintText,
      controller: streetController,
      focusNode: streetNode,
      // onFieldSubmitted: (value) => townNode.requestFocus(),
    );

    final AddressTextField townTextfield = AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: townHintText,
      controller: townController,
      focusNode: townNode,
      // onFieldSubmitted: (value) => postCodeNode.requestFocus(),
    );

    final AddressTextField postCodeTextfield = AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: postCodeHintText,
      controller: postCodeController,
      focusNode: postCodeNode,
      onChanged: (value) => controller.onChangePostcode(value),
      onFieldSubmitted: (value) => cityNode.requestFocus(),
    );

    final cityDropdown = AddressDropdownButton(
      width: fieldWidth,
      height: fieldHeight,
      margin: childPadding,
      // value: controller.selectedCityItem.value,
      onChanged: (newValue) async {
        postCodeController.text =
            await controller.cityOnChange(newValue.toString());
      },
      focusNode: cityNode,
      type: 'city',
      tagController: tagController,
    );

    final districtDropdown = AddressDropdownButton(
      width: fieldWidth,
      height: fieldHeight,
      margin: childPadding,
      // value: controller.selectedDistrictItem.value,
      onChanged: (newValue) async {
        postCodeController.text =
            await controller.districtOnChange(newValue.toString());
      },
      focusNode: districtNode,
      type: 'district',
      tagController: tagController,
    );

    final wardDropdown = AddressDropdownButton(
      width: fieldWidth,
      height: fieldHeight,
      margin: childPadding,
      // value: controller.selectedWardItem.value,
      focusNode: wardNode,
      onChanged: (newValue) async {
        postCodeController.text =
            await controller.wardOnChange(newValue.toString());
      },
      type: 'ward',
      tagController: tagController,
    );

    final AddressLabel streetLabel = AddressLabel(
      text: streetLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AddressLabel postCodeLabel = AddressLabel(
      text: postCodeLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AddressLabel cityLabel = AddressLabel(
      text: cityLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AddressLabel districtLabel = AddressLabel(
      text: districtLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AddressLabel wardLabel = AddressLabel(
      text: wardLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AddressLabel townLabel = AddressLabel(
      text: townLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    final AutocompleteExample example = AutocompleteExample(
      items: controller.cityItems,
      width: fieldWidth,
      height: fieldHeight,
      margin: childPadding,
      onSelected: (newValue) async {
        postCodeController.text =
            await controller.cityOnChange(newValue.toString());
      },
    );

    Map<WidgetMapping, Widget> map = mappingWidget(
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
