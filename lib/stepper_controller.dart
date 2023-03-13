import 'package:flutter/material.dart';
import 'package:flutter_application_1/event.dart';
import 'package:flutter_application_1/stepper_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StepperController extends GetxController {
  final _stepper = GetStorage();
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

class CartController extends GetxController {
  final _cart = GetStorage();
  var _event = <Event>[].obs;
  var selectedEvent = <Event>[].obs;

  void addEvent(Event event) {
    _event.add(event);
    selectedEvent.add(event);
    Get.snackbar(
      "Event Added to The Cart",
      event.eventName,
      duration: const Duration(
        milliseconds: 1000,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }


  void removeEvent(Event event) {
    _event.remove(event);
    selectedEvent.remove(event);
  }

  get product => _event;
  get product1 => selectedEvent;

  void toggleEvent(Event event) {
    if (selectedEvent.contains(event)) {
      selectedEvent.remove(event);
    } else {
      selectedEvent.add(event);
    }
  }

  double get totalAmount =>
      selectedEvent.fold(0.0, (sum, product) => sum + product.price);
}
