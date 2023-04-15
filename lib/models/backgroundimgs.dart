import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/models/custom_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import '../controllers/stepper_controller.dart';

Widget backgroundimg(BuildContext context) {
  final StepperController controller = Get.put(StepperController());
  return Obx(() {
    if (controller.currentpos.value == 0) {
      return GlassImage(
        blur: 1,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        image: const Image(
          image: AssetImage('assets/2602803.jpg'),
          fit: BoxFit.fitHeight,
        ),
      );
    } else if (controller.currentpos.value == 1) {
      return GlassImage(
        blur: 1,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        image: const Image(
          image: AssetImage('assets/space.jpg'),
          fit: BoxFit.fitHeight,
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/PIA12348_orig.jpg',
          //   ),
          //   fit: BoxFit.fitHeight,
          // ),
          color: Colors.white,
        ),
      );
    }
  });
}

Widget showContainer2(BuildContext context, ControlsDetails detail) {
  final StepperController controller = Get.put(StepperController());
  if (controller.currentpos.value == 0) {
    return const SizedBox(
      height: 0,
    );
  } else if (controller.currentpos.value == 1) {
    return const SizedBox(
      height: 0,
    );
  } else {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          onPressed: detail.onStepCancel,
          child: Text(
            controller.getCancelText(controller.currentpos.value),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontFamily: 'OxaniumLight',
            ),
          ),
        ),
      ),
    );
  }
}

Widget showContainer1(BuildContext context, ControlsDetails detail) {
  final StepperController controller = Get.put(StepperController());
  final CartController cartController = Get.put(CartController());
  if (controller.currentpos.value == 0) {
    return Container(
      //margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.white,
        ),
      )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: 'OxaniumLight',
                      ),
                    )),
                Text(
                  "	₹${cartController.totalAmount.toString()}",
                  style: const TextStyle(
                      fontFamily: 'OxaniumLight',
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: detail.onStepContinue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.getcontinueText(controller.currentpos.value),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'OxaniumLight',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } else if (controller.currentpos.value == 1) {
    return Container(
      //margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.white,
        ),
      )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: detail.onStepCancel,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                    ),
                  ),
                  Text(
                    controller.getCancelText(controller.currentpos.value),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'OxaniumLight',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: detail.onStepContinue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.getcontinueText(controller.currentpos.value),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'OxaniumLight',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: ButtonStyles.buttonColor,
          ),
          onPressed: detail.onStepContinue,
          child: Text(
            controller.getcontinueText(controller.currentpos.value),
          ),
        ),
      ),
    );
  }
}
