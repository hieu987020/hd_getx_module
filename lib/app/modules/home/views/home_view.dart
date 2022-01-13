import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hd_getx_module/app/modules/home/views/home_widget.dart';

import '../controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const CustomeWidget(
        firstChild: Text('first chsild'),
        secondChild: Text('second child'),
        customeStyle: CustomeStyle.column,
      ),
    );
  }
}
