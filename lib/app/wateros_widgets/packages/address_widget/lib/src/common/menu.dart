// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

/// [AddressMenu] is menu of address form
class AddressMenu extends GetView<AddressController> {
  const AddressMenu({this.tagController});

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
