import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/stepper_controller.dart';

class CartProducts extends StatelessWidget {
  CartProducts({Key? key}) : super(key: key);
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (cartController.product.length == 0) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.58,
            child: Center(
              child: const Text(
                'Cart Is Empty ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Mars Bold',
                ),
              ),
            ),
          );
        } else {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: const Center(
                  child: Text(
                    'Events List',
                    style: TextStyle(
                      fontFamily: 'OxaniumLight',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
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
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class CartProductCard extends StatefulWidget {
  final CartController controller;
  final int index;
  final Event event;
  const CartProductCard({
    super.key,
    required this.controller,
    required this.index,
    required this.event,
  });

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  bool startAnimation = false;
  final controller1 = Get.put(StepperController());

  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(
          milliseconds: 500 + (widget.index * 100),
        ),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQuery.of(context).size.height * 0.11,
          child: Center(
            child: CheckboxListTile(
              onChanged: (value) {
                cartController.toggleEvent(widget.event);
              },
              value: cartController.selectedEvent.contains(widget.event),
              title: Text(
                "                ${widget.event.eventName}",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: 'OxaniumRegular',
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              secondary: IconButton(
                onPressed: () {
                  cartController.removeEvent(widget.event);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                //   color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
