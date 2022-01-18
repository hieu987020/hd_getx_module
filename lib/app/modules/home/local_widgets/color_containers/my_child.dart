import 'dart:ui';

import 'package:flutter/material.dart';

class MyChild extends StatelessWidget {
  const MyChild({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}
