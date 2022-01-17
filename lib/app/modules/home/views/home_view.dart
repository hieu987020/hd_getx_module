import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';
import 'package:hd_getx_module/app/modules/home/local_widgets/color_containers/my_child.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  List<Widget> buildChild1() {
    return const [
      MyChild(text: 'Child 1', color: Colors.green),
      MyChild(text: 'Child 2', color: Colors.blue),
      MyChild(text: 'Child 3', color: Colors.red),
      MyChild(text: 'Child 4', color: Colors.yellow),
      MyChild(text: 'Child 5', color: Colors.pinkAccent),
      MyChild(text: 'Child 6', color: Colors.lightGreen),
    ];
  }

  List<Widget> buildChild2() {
    return const [
      MyChild(text: 'Child 1', color: Colors.green),
      MyChild(text: 'Child 2', color: Colors.blue),
      MyChild(text: 'Child 3', color: Colors.red),
      MyChild(text: 'Child 4', color: Colors.yellow),
    ];
  }

  Widget buildTitle() {
    return const MyChild(
        width: 200, text: 'THIS IS TITLE', color: Colors.amber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            AddressWidget(
              width: 400,
              height: 450,
              color: Colors.blueGrey,
              addressStyle: AddressStyle.twoColumn,
              showChangeStyleIcon: true,
              title: buildTitle(),
              child: buildChild1(),
              tagController: 'tag1',
            ),
            const SizedBox(height: 20),
            AddressWidget(
              width: 240,
              height: 350,
              color: Colors.blueGrey,
              addressStyle: AddressStyle.twoColumn,
              showChangeStyleIcon: true,
              title: buildTitle(),
              child: buildChild2(),
              tagController: 'tag2',
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
