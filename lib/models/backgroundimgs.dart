import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/custom_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
              'assets/img1.jpg',
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

Widget showContainer2(BuildContext context, ControlsDetails detail) {
  final StepperController controller = Get.put(StepperController());
  if (controller.currentpos.value == 0) {
    return SizedBox(
      height: 0,
    );
  } else {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          child: Text(
            controller.getCancelText(controller.currentpos.value),
          ),
          onPressed: detail.onStepCancel,
        ),
      ),
    );
  }
}

Widget showContainer1(BuildContext context, ControlsDetails detail) {
  final StepperController controller = Get.put(StepperController());
  if (controller.currentpos.value == 0) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          child: Text(
            controller.getcontinueText(controller.currentpos.value),
          ),
          onPressed: detail.onStepContinue,
        ),
      ),
    );
  } else if (controller.currentpos.value == 1) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          child: Text(
            controller.getcontinueText(controller.currentpos.value),
          ),
          onPressed: detail.onStepContinue,
        ),
      ),
    );
  } else {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          child: Text(
            controller.getcontinueText(controller.currentpos.value),
          ),
          onPressed: detail.onStepContinue,
        ),
      ),
    );
  }
}
