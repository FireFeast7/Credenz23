// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/views/events_page.dart';
import 'package:flutter_application_1/views/single_event.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zoom Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoard(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To A Cart Page",
        ),
      ),
      floatingActionButton: Obx(
        () => Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.to(
                  () => EventsList(),
                );
              },
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            Badge(
              largeSize: 17,
              backgroundColor: Colors.black,
              label: cartController.selectedEvent.isNotEmpty
                  ? Text(
                      cartController.selectedEvent.length.toString(),
                    )
                  : Text("0"),
            ),
          ],
        ),
      ),
    );
  }
}
