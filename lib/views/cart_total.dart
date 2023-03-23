
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final controller1 = Get.put(StepperController());
  final cartController = Get.put(CartController());

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
                        Text(cartController.totalAmount.toString()),
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
