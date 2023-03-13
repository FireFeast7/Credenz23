import 'package:flutter/material.dart';

class ButtonStyles {
  static MaterialStateProperty<Color> buttonColor =
      MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.redAccent;
      } else {
        return Colors.redAccent;
      }
    },
  );
}
