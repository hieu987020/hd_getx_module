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
          addressStyle: AddressStyle.column,
          showChangeStyleIcon: true,
          firstChild: const MyChild(text: 'first child', color: Colors.green),
          secondChild: const MyChild(text: 'second child', color: Colors.blue),
          thirdChild: const MyChild(text: 'third child', color: Colors.red),
          fourthChild:
              const MyChild(text: 'fourth child', color: Colors.yellow),
          fifthChild: const MyChild(text: 'fifth child', color: Colors.pink),
          sixthChild: const MyChild(text: 'sixth child', color: Colors.brown),
        ),
      ),
    );
  }
}

class MyChild extends StatelessWidget {
  const MyChild({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 50,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
