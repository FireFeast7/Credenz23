import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StepperController extends GetxController {
  var currentpos = 0.obs;
  var complete = false.obs;

  final List<String> _continueText = [
    "To Final Checkout",
    "To Final Payment",
    "Payment"
  ];
  final List<String> _cancelText = [
    "To Events Page",
    "To Events List",
    "To Final Checkout"
  ];
  String getcontinueText(int currentpos) {
    if (currentpos < _continueText.length) {
      return _continueText[currentpos];
    } else {
      return "Continue";
    }
  }

  String getCancelText(int currentPos) {
    if (currentPos < _cancelText.length) {
      return _cancelText[currentPos];
    }
    return "Cancel";
  }
}


