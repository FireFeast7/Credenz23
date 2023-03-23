import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/backgroundimgs.dart';
import 'package:flutter_application_1/models/custom_button.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:flutter_application_1/views/cart_total.dart';
import 'package:flutter_application_1/views/cartproducts.dart';
import 'package:flutter_application_1/views/events_page.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:get/get.dart';
import 'package:animated_card/animated_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';

class CartPage extends StatelessWidget {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text(
          "Event Summary",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          backgroundimg(context),
          Obx(
            () => Theme(
              data: ThemeData(
                canvasColor: Colors.red,
              ),
              child: Stepper(
                physics: const NeverScrollableScrollPhysics(),
                type: StepperType.horizontal,
                margin: const EdgeInsets.all(5),
                currentStep: controller.currentpos.value,
                steps: allSteps(),
                onStepContinue: () {
                  if ((controller.currentpos.value == allSteps().length - 1) ||
                      cartController.totalAmount == 0) {
                    null;
                  } else {
                    controller.currentpos.value++;
                  }
                },
                onStepCancel: () {
                  controller.currentpos.value == 0
                      ? null
                      : controller.currentpos.value--;
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
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
                                controller.getcontinueText(
                                    controller.currentpos.value),
                              ),
                              onPressed: details.onStepContinue,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 3,
                          color: Colors.black,
                        ),
                        Container(
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
                                controller
                                    .getCancelText(controller.currentpos.value),
                              ),
                              onPressed: details.onStepCancel,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> allSteps() {
    return [
      Step(
        title: const Text(
          "Events List",
          style: TextStyle(fontSize: 13),
        ),
        content: CartProducts(),
        isActive: controller.currentpos.value >= 0,
        state:
            (controller.currentpos.value > 0 && cartController.totalAmount > 0)
                ? StepState.complete
                : StepState.indexed,
      ),
      Step(
        title: const Text(
          "CheckOut",
          style: TextStyle(fontSize: 13),
        ),
        content: CartTotal(),
        isActive: controller.currentpos.value >= 1,
        state: controller.currentpos.value > 1
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: const Text(
          "Payment",
          style: TextStyle(fontSize: 13),
        ),
        content: Container(
          height: 100,
          color: Colors.red,
        ),
        isActive: controller.currentpos.value >= 2,
        state: controller.currentpos.value > 2
            ? StepState.complete
            : StepState.indexed,
      ),
    ];
  }
}
