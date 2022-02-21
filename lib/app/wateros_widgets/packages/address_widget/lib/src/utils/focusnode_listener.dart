import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void addListener(
  FocusNode streetNode,
  FocusNode townNode,
  FocusNode postCodeNode,
  FocusNode cityNode,
  FocusNode districtNode,
  FocusNode wardNode,
) {
  streetNode.onKey = ((streetNode, RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      postCodeNode.requestFocus();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  });
}
