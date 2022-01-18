import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';
import 'package:hd_getx_module/app/modules/home/local_widgets/color_containers/my_child.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              AddressWidget(
                width: 400,
                height: 450,
                color: Colors.grey[800],
                addressStyle: AddressStyle.oneColumn,
                showChangeStyleIcon: true,
                title: const MyChild(text: 'THIS IS TITLE'),
                tagController: 'tag1',
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
