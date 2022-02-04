import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_controller.dart';

enum AddressStyle {
  oneColumn,
  twoColumn,
}

class _DefaultText {
  static const String titleText = "Thông tin người liên hệ";

  static const String streetHintText = "Nhập Số nhà/Tên đường";
  static const String postCodeHintText = "Nhập mã địa lý hành chính";
  static const String cityHintText = "Lựa chọn Tỉnh/ Thành Phố";
  static const String districtHintText = "Lựa chọn Quận/Huyện";
  static const String wardHintText = "Lựa chọn Xã/Phường/Thị trấn";
  static const String townHintText = "Lựa chọn Thôn/Ấp/Khu phố";

  static const String streetLabelText = "Số nhà/ Tên đường:(*)";
  static const String postCodeLabelText = "Mã Tĩnh/Quận/Xã:";
  static const String cityLabelText = "Tỉnh/Thành phố:(*)";
  static const String districtLabelText = "Quận/Huyện:(*)";
  static const String wardLabelText = "Xã/Phường/Thị trấn:(*)";
  static const String townLabelText = "Thôn/Ấp/Khu phố:";
}

class AddressWidget extends GetView<AddressController> {
  // ignore: use_key_in_widget_constructors
  const AddressWidget({
    this.titleText = _DefaultText.titleText,
    this.titlePadding = const EdgeInsets.all(20),
    this.labelWidth = 200,
    this.labelHeight = 30,
    this.fieldWidth = 300,
    this.fieldHeight = 60,
    this.childPadding = const EdgeInsets.all(5),
    this.streetLabelText = _DefaultText.streetLabelText,
    this.postCodeLabelText = _DefaultText.postCodeLabelText,
    this.cityLabelText = _DefaultText.cityLabelText,
    this.districtLabelText = _DefaultText.districtLabelText,
    this.wardLabelText = _DefaultText.wardLabelText,
    this.townLabelText = _DefaultText.townLabelText,
    this.streetHintText = _DefaultText.streetHintText,
    this.postCodeHintText = _DefaultText.postCodeHintText,
    this.cityHintText = _DefaultText.cityHintText,
    this.districtHintText = _DefaultText.districtHintText,
    this.wardHint = _DefaultText.wardHintText,
    this.townHint = _DefaultText.townHintText,
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
  //? title
  final String titleText;
  final EdgeInsetsGeometry? titlePadding;
  //? child
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
  //? control
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

    Container titleWidget = Container(
      margin: titlePadding,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
    );

    _AddressTextField streetTextfield = _AddressTextField(
      // key: UniqueKey(),
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: streetHintText,
    );

    _AddressTextField townTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: townHint,
    );

    _AddressTextField postCodeTextfield = _AddressTextField(
      width: fieldWidth,
      height: fieldHeight,
      childPadding: childPadding,
      hintText: postCodeHintText,
    );

    Obx cityDropdown = Obx(() {
      return _AddressDropdownButton(
        width: fieldWidth,
        height: fieldHeight,
        margin: childPadding,
        hintText: cityHintText,
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

    Obx wardDropdown = Obx(() {
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

    _AddressLabel streetLabel = _AddressLabel(
      text: streetLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressLabel postCodeLabel = _AddressLabel(
      text: postCodeLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressLabel cityLabel = _AddressLabel(
      text: cityLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressLabel districtLabel = _AddressLabel(
      text: districtLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressLabel wardLabel = _AddressLabel(
      text: wardLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressLabel townLabel = _AddressLabel(
      text: townLabelText,
      width: labelWidth,
      height: labelHeight,
      margin: childPadding,
      tagController: tagController,
    );

    _AddressMenu menu = _AddressMenu(
      tagController: tagController,
    );
    List<Widget> list = [];
    list.add(titleWidget);
    list.add(menu);
    list.add(streetLabel);
    list.add(streetTextfield);
    list.add(townLabel);
    list.add(townTextfield);
    list.add(postCodeLabel);
    list.add(postCodeTextfield);
    list.add(cityLabel);
    list.add(cityDropdown);
    list.add(districtLabel);
    list.add(districtDropdown);
    list.add(wardLabel);
    list.add(wardDropdown);

    Map<String, Widget> map = {};
    map.putIfAbsent('title', () => titleWidget);
    map.putIfAbsent('menu', () => menu);

    Obx child = Obx(() {
      switch (controller.addressStyle.value) {
        case AddressStyle.oneColumn:
          return StyleOneColumn(
            titleWidget: titleWidget,
            streetTextfield: streetTextfield,
            townTextfield: townTextfield,
            postCodeTextfield: postCodeTextfield,
            cityDropdown: cityDropdown,
            districtDropdown: districtDropdown,
            wardDropdown: wardDropdown,
            menu: menu,
            streetLabel: streetLabel,
            postCodeLabel: postCodeLabel,
            cityLabel: cityLabel,
            districtLabel: districtLabel,
            wardLabel: wardLabel,
            townLabel: townLabel,
            map: map,
          );
        case AddressStyle.twoColumn:
          return StyleTwoColumn(
            titleWidget: titleWidget,
            streetTextfield: streetTextfield,
            townTextfield: townTextfield,
            postCodeTextfield: postCodeTextfield,
            cityDropdown: cityDropdown,
            districtDropdown: districtDropdown,
            wardDropdown: wardDropdown,
            menu: menu,
            streetLabel: streetLabel,
            postCodeLabel: postCodeLabel,
            cityLabel: cityLabel,
            districtLabel: districtLabel,
            wardLabel: wardLabel,
            townLabel: townLabel,
            list: list,
          );
        default:
          return const SizedBox();
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
  const StyleOneColumn(
      {Key? key,
      required this.titleWidget,
      required this.streetTextfield,
      required this.townTextfield,
      required this.postCodeTextfield,
      required this.cityDropdown,
      required this.districtDropdown,
      required this.wardDropdown,
      required this.streetLabel,
      required this.postCodeLabel,
      required this.cityLabel,
      required this.districtLabel,
      required this.wardLabel,
      required this.townLabel,
      required this.menu,
      required this.map})
      : super(key: key);

  final Widget titleWidget;
  final Widget streetTextfield;
  final Widget townTextfield;
  final Widget postCodeTextfield;
  final Widget cityDropdown;
  final Widget districtDropdown;
  final Widget wardDropdown;

  final Widget streetLabel;
  final Widget postCodeLabel;
  final Widget cityLabel;
  final Widget districtLabel;
  final Widget wardLabel;
  final Widget townLabel;
  final Widget menu;
  final Map<String, Widget> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      // children: [
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [list[0], list[1]],
      //   ),
      //   Row(children: [list.elementAt(2), list.elementAt(3)]),
      //   // Row(children: [townLabel, townTextfield]),
      //   // Row(children: [postCodeLabel, postCodeTextfield]),
      //   // Row(children: [cityLabel, cityDropdown]),
      //   // Row(children: [districtLabel, districtDropdown]),
      //   // Row(children: [wardLabel, wardDropdown]),
      // ],
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [map['title']!, map['menu']!],
        ),
        Row(children: [streetLabel, streetTextfield]),
        Row(children: [townLabel, townTextfield]),
        Row(children: [postCodeLabel, postCodeTextfield]),
        Row(children: [cityLabel, cityDropdown]),
        Row(children: [districtLabel, districtDropdown]),
        Row(children: [wardLabel, wardDropdown]),
      ],
    );
  }
}

class StyleTwoColumn extends StatelessWidget {
  const StyleTwoColumn({
    Key? key,
    required this.titleWidget,
    required this.streetTextfield,
    required this.townTextfield,
    required this.postCodeTextfield,
    required this.cityDropdown,
    required this.districtDropdown,
    required this.wardDropdown,
    required this.menu,
    required this.streetLabel,
    required this.postCodeLabel,
    required this.cityLabel,
    required this.districtLabel,
    required this.wardLabel,
    required this.townLabel,
    required this.list,
  }) : super(key: key);

  final Widget titleWidget;
  final Widget streetTextfield;
  final Widget townTextfield;
  final Widget postCodeTextfield;
  final Widget cityDropdown;
  final Widget districtDropdown;
  final Widget wardDropdown;

  final Widget menu;
  final Widget streetLabel;
  final Widget postCodeLabel;
  final Widget cityLabel;
  final Widget districtLabel;
  final Widget wardLabel;
  final Widget townLabel;
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [titleWidget, menu],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                streetLabel,
                streetTextfield,
                townLabel,
                townTextfield,
                postCodeLabel,
                postCodeTextfield,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cityLabel,
                cityDropdown,
                districtLabel,
                districtDropdown,
                wardLabel,
                wardDropdown,
              ],
            ),
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
  }) : super(key: key);

  final EdgeInsetsGeometry? childPadding;
  final double? width;
  final double? height;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: childPadding,
      width: width,
      height: height,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
        ),
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
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String hintText;
  final Object? value;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
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
