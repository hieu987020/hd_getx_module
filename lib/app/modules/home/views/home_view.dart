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
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              AddressWidget(
                width: 400,
                height: 550,
                color: Colors.grey[800],
                addressStyle: AddressStyle.oneColumn,
                showChangeStyleIcon: true,
                tagController: 'tag1',
                jsonOutput: output,
              ),
              // const SizedBox(height: 10),
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
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
