import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final _event = <Event>[].obs;
  var selectedEvent = <Event>[].obs;
  RxBool emptyCart = true.obs;

  void showBar(RxList<Event> list) {
    if (list.isNotEmpty) {
      emptyCart.value = false;
    } else {
      emptyCart.value = true;
    }
  }

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

class PaymentController extends GetxController {
  RxBool showQR = false.obs;
  RxString payment = ''.obs;

  RxBool success = false.obs;
  Rx<TextEditingController> id = TextEditingController().obs;
}
