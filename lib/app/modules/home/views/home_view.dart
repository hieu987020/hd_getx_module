import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';
import 'package:hd_getx_module/app/modules/home/local_widgets/my_child.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: const Center(
        child: AddressWidget(
          width: 400,
          height: 450,
          color: Colors.blueGrey,
          addressStyle: AddressStyle.twoColumn,
          showChangeStyleIcon: true,
          title:
              MyChild(width: 200, text: 'THIS IS TITLE', color: Colors.amber),
          firstChild: MyChild(text: 'Child 1', color: Colors.green),
          secondChild: MyChild(text: 'Child 2', color: Colors.blue),
          thirdChild: MyChild(text: 'Child 3', color: Colors.red),
          fourthChild: MyChild(text: 'Child 4', color: Colors.yellow),
          fifthChild: MyChild(text: 'Child 5', color: Colors.pinkAccent),
          sixthChild: MyChild(text: 'Child 6', color: Colors.lightGreen),
        ),
      ),
    );
  }
}
