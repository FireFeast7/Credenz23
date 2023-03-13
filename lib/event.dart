import 'package:flutter_application_1/stepper_controller.dart';
import 'package:get/get.dart';
import 'dart:convert';

class Event extends GetxController {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  final String eventName;
  final double price;
  Event({
    required this.eventName,
    required this.price,
  });

  static List<Event> events = [
    Event(
      eventName: 'Enigma',
      price: 100,
    ),
    Event(
      eventName: 'DataWiz',
      price: 40,
    ),
    Event(
      eventName: 'Clash RC',
      price: 100,
    ),
    Event(
      eventName: '1',
      price: 40,
    ),
  ].obs;
}
