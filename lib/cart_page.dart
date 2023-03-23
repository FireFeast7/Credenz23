// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/event.dart';
import 'package:flutter_application_1/events_page.dart';
import 'package:flutter_application_1/stepper_controller.dart';
import 'package:get/get.dart';
import 'package:animated_card/animated_card.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_button.dart';

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

class CartProducts extends StatelessWidget {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    if (cartController.product.length == 0) {
      return Container(
        height: 500,
        child: const Image(
          image: NetworkImage(
            "https://shop.millenniumbooksource.com/static/images/cart1.png",
          ),
          fit: BoxFit.fill,
        ),
      );
    }
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.63,
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.63 - 100,
            child: ListView.builder(
              itemCount: cartController.product.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                final event = cartController.product[index];
                return CartProductCard(
                  controller: cartController,
                  index: index,
                  event: event,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final controller1 = Get.put(StepperController());
  final cartController = Get.put(CartController());
  final int index;
  final Event event;
  CartProductCard({
    super.key,
    required this.controller,
    required this.index,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedCard(
          curve: Curves.ease,
          direction: AnimatedCardDirection.bottom,
          initDelay: const Duration(seconds: 0),
          duration: const Duration(milliseconds: 1500),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            height: 150,
            child: Center(
              child: CheckboxListTile(
                onChanged: (value) {
                  cartController.toggleEvent(event);
                },
                value: cartController.selectedEvent.contains(event),
                title: Text(
                  event.eventName,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: IconButton(
                    onPressed: () {
                      cartController.removeEvent(event);
                    },
                    icon: const Icon(
                      Icons.cancel,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final controller1 = Get.put(StepperController());
  final cartController = Get.put(CartController());
  final CartController controller = Get.find();

  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.63,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.63 - 100,
                      child: ListView.builder(
                        itemCount: cartController.product1.length,
                        itemBuilder: (BuildContext context, int index) {
                          final event = cartController.product1[index];
                          return FinalListCards(index: index, event: event);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total"),
                        Text(controller.totalAmount.toString()),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinalListCards extends StatelessWidget {
  final int index;
  final Event event;
  final CartController controller = Get.put(CartController());
  final StepperController ctr = Get.put(StepperController());
  FinalListCards({super.key, required this.index, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // image: DecorationImage(
                //   image: NetworkImage(
                //       "https://images.crowdspring.com/blog/wp-content/uploads/2022/08/18131304/apple_logo_black.svg_.png"),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: 120,
                    child: Image.network(
                      "https://images.crowdspring.com/blog/wp-content/uploads/2022/08/18131304/apple_logo_black.svg_.png",
                      color: Colors.blue,
                      alignment: Alignment.centerLeft,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(event.eventName),
                      Text(event.price.toString()),
                      Text("11:00AM - 12:00PM"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
