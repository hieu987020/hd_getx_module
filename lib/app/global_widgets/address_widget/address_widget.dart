import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class _DefaultText {
  static const String titleLabel = "Thông tin người liên hệ";
  static const String streetLabel = "Nhập Số nhà/Tên đường";
  static const String postCodeLabel = "Nhập mã địa lý hành chính";
  static const String cityLabel = "Lựa chọn Tỉnh/ Thành Phố";
  static const String districtLabel = "Lựa chọn Quận/Huyện";
  static const String wardLabel = "Lựa chọn Xã/Phường/Thị trấn";
  static const String townLabel = "Lựa chọn Thôn/Ấp/Khu phố";
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    //? Customize
    this.addressStyle = AddressStyle.oneColumn,
    this.showChangeStyleIcon = false,
    this.tagController,
    this.jsonOutput,
    this.childPadding = const EdgeInsets.all(5),
    this.childWidth = 260,
    this.childHeight = 50,
    //? Basic Container
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

  //? Customize
  final AddressStyle addressStyle;
  final bool showChangeStyleIcon;
  final String? tagController;
  final TextEditingController? jsonOutput;
  final EdgeInsetsGeometry? childPadding;
  final double? childWidth;
  final double? childHeight;
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
    controller.initNow(addressStyle);
    // const EdgeInsets defaultMargin = EdgeInsets.all(5);

    Widget streetTextfield =
        _AddressTextFielddd(childPadding: childPadding, childWidth: childWidth);

    Widget postCodeTextfield =
        _AddressTextFielddd(childPadding: childPadding, childWidth: childWidth);

    Obx cityDropdown = Obx(() {
      return _AddressDropdownButton(
        // key: const Key('city'),
        width: childWidth,
        margin: childPadding,
        hintText: _DefaultText.cityLabel,
        value: controller.selectedCity.value,
        onChanged: (Object? newValue) {
          controller.cityOnChange(newValue.toString());
        },
        items:
            controller.listCity.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    Obx districtDropdown = Obx(() {
      return _AddressDropdownButton(
        // key: const Key('district'),
        width: childWidth,
        margin: childPadding,
        hintText: _DefaultText.districtLabel,
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

    Obx wardDropdown = Obx(() {
      return _AddressDropdownButton(
        // key: const Key('ward'),
        width: childWidth,
        margin: childPadding,
        hintText: _DefaultText.wardLabel,
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

    Obx townDropdown = Obx(() {
      return _AddressDropdownButton(
        // key: const Key('town'),
        width: childWidth,
        margin: childPadding,
        hintText: _DefaultText.townLabel,
        value: controller.selectedTown.value,
        onChanged: (Object? newValue) {
          controller.townOnChange(newValue.toString());
        },
        items:
            controller.listTown.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });

    Container header = Container(
      margin: childPadding,
      child: const Text(
        _DefaultText.titleLabel,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Obx body = Obx(() {
      return _LayoutStyle(
        streetTextfield: streetTextfield,
        postCodeTextfield: postCodeTextfield,
        cityDropdown: cityDropdown,
        districtDropdown: districtDropdown,
        wardDropdown: wardDropdown,
        townDropdown: townDropdown,
        addressStyle: controller.addressStyle.value,
      );
    });

    Widget footer = _ChangeStyleButton(
        showChangeStyleIcon: showChangeStyleIcon, controller: controller);

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
      child: _AddressWidget(header: header, body: body, footer: footer),
    );
  }
}

class _AddressWidget extends StatelessWidget {
  const _AddressWidget({
    Key? key,
    required this.header,
    required this.body,
    required this.footer,
  }) : super(key: key);

  final Container header;
  final Obx body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        header,
        body,
        footer,
      ],
    );
  }
}

class _ChangeStyleButton extends StatelessWidget {
  const _ChangeStyleButton({
    Key? key,
    required this.showChangeStyleIcon,
    required this.controller,
  }) : super(key: key);

  final bool showChangeStyleIcon;
  final AddressController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showChangeStyleIcon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            iconSize: 40,
            onPressed: () {
              controller.changeStyle();
            },
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
    );
  }
}

class _AddressTextFielddd extends StatelessWidget {
  const _AddressTextFielddd({
    Key? key,
    this.childPadding,
    this.childWidth,
  }) : super(key: key);

  final EdgeInsetsGeometry? childPadding;
  final double? childWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: childPadding,
      width: childWidth,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: _DefaultText.streetLabel,
        ),
      ),
    );
  }
}

class _AddressDropdownButton extends StatelessWidget {
  const _AddressDropdownButton({
    Key? key,
    this.width,
    this.margin,
    required this.hintText,
    this.value,
    this.onChanged,
    required this.items,
  }) : super(key: key);

  final double? width;
  final EdgeInsetsGeometry? margin;
  final String hintText;
  final Object? value;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
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
      ),
    );
  }
}

class _AutocompleteExample extends StatelessWidget {
  const _AutocompleteExample({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      width: 260,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return list.where((String option) {
            return option.contains(textEditingValue.text);
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        },
        optionsViewBuilder: (
          BuildContext context,
          AutocompleteOnSelected<String> onSelected,
          Iterable<String> options,
        ) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: Container(
                width: 300,
                color: Colors.teal,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(option,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LayoutStyle extends StatelessWidget {
  const _LayoutStyle({
    Key? key,
    this.streetTextfield,
    this.postCodeTextfield,
    this.cityDropdown,
    this.districtDropdown,
    this.wardDropdown,
    this.townDropdown,
    this.addressStyle,
  }) : super(key: key);

  final Widget? streetTextfield;
  final Widget? postCodeTextfield;
  final Widget? cityDropdown;
  final Widget? districtDropdown;
  final Widget? wardDropdown;
  final Widget? townDropdown;
  final AddressStyle? addressStyle;
  @override
  Widget build(BuildContext context) {
    switch (addressStyle) {
      case AddressStyle.oneColumn:
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  streetTextfield!,
                  postCodeTextfield!,
                  cityDropdown!,
                  districtDropdown!,
                  wardDropdown!,
                  townDropdown!,
                ],
              ),
            ],
          ),
        );
      case AddressStyle.twoColumn:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                streetTextfield!,
                postCodeTextfield!,
                cityDropdown!,
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                districtDropdown!,
                wardDropdown!,
                townDropdown!,
              ],
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
    
    
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