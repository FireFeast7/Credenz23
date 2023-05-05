import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/backgroundimgs.dart';
import 'package:flutter_application_1/models/custom_button.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:flutter_application_1/views/cart_total.dart';
import 'package:flutter_application_1/views/cartproducts.dart';

import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/views/payment.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    cartController.showBar(cartController.selectedEvent);
    controller.currentpos.value = 0;
    //  int step = controller.currentpos.value;
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: cartController.emptyCart.value,
        resizeToAvoidBottomInset: false,
        extendBody: cartController.emptyCart.value,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: cartController.emptyCart.value
              ? Colors.transparent
              : Colors.indigo[900],
          shadowColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "MY CART",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Mars Bold',
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            backgroundimg(context),
            Obx(
              () => Container(
                color: Colors.transparent,
                margin: cartController.emptyCart.value
                    ? const EdgeInsets.fromLTRB(5, 110, 5, 5)
                    : const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  type: StepperType.horizontal,
                  margin: const EdgeInsets.all(5),
                  currentStep: controller.currentpos.value,
                  onStepTapped: (step) {
                    if (cartController.totalAmount > 0) {
                      controller.currentpos.value = step;
                    }
                  },
                  steps: allSteps(),
                  onStepContinue: () {
                    if ((controller.currentpos.value ==
                            allSteps().length - 1) ||
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
                    ControlsDetails detail = details;
                    return Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          showContainer1(context, detail),
                          showContainer2(context, detail),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> allSteps() {
    return [
      Step(
        title: const Text(
          "",
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
          "",
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
          "",
          style: TextStyle(fontSize: 13),
        ),
        content: PaymentView(),
        isActive: controller.currentpos.value >= 2,
        state: controller.currentpos.value > 2
            ? StepState.complete
            : StepState.indexed,
      ),
    ];
  }
}
