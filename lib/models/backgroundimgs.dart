import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/stepper_controller.dart';

Widget backgroundimg(BuildContext context) {
  final StepperController controller = Get.put(StepperController());
  return Obx(() {
    if (controller.currentpos.value == 0) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/PIA12348_orig.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    } else if (controller.currentpos.value == 1) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/PIA08653_orig.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/PIA12348_orig.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }
  });
}