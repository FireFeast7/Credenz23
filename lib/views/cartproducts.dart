import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
 
import '../controllers/stepper_controller.dart';

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
