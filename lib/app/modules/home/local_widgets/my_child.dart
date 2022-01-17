import 'package:flutter/material.dart';

class MyChild extends StatelessWidget {
  const MyChild({
    Key? key,
    required this.color,
    required this.text,
    this.width = 100,
    this.height = 50,
  }) : super(key: key);
  final Color color;
  final String text;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
