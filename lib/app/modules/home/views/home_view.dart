import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_getx_module/app/global_widgets/address_widget/address_widget.dart';
import 'package:hd_getx_module/app/modules/home/controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController output = TextEditingController(text: '');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              AddressWidget(
                width: 650,
                height: 450,
                color: Colors.black,
                childPadding: const EdgeInsets.symmetric(horizontal: 10),
                tagController: 'tag1',
                jsonOutput: output,
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (_) => AlertDialog(
              //                 title: const Text('Địa chỉ của bạn'),
              //                 content: Text(output.text),
              //               ));
              //     },
              //     child: const Text('Show output')),
              // const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
