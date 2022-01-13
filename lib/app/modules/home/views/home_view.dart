import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';

import 'package:hd_getx_module/app/modules/home/views/home_widget.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: AddressWidget(
          width: 400,
          height: 400,
          color: Colors.grey,
          firstChild: Container(
            color: Colors.green,
            width: 100,
            height: 50,
            child: const Center(child: Text('first child')),
          ),
          secondChild: Container(
            color: Colors.blue,
            width: 120,
            height: 50,
            child: const Center(child: Text('second child')),
          ),
          thirdChild: Container(
            color: Colors.red,
            width: 140,
            height: 50,
            child: const Center(child: Text('third child')),
          ),
          fourthChild: Container(
            color: Colors.yellow,
            width: 160,
            height: 50,
            child: const Center(child: Text('fourth child')),
          ),
          customeStyle: AddressStyle.column,
        ),
      ),
    );
  }
}
