import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class CartTotal extends StatelessWidget {
  final controller1 = Get.put(StepperController());
  final cartController = Get.put(CartController());

  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width,
              //       color: Colors.transparent,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ]),
              child: const Center(
                child: Text(
                  'Final Checkout',
                  style: TextStyle(
                    fontFamily: 'Mars Bold',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.58 - 100,
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
                    padding: EdgeInsets.only(top: 30),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Total (${cartController.selectedEvent.length} events)",
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontFamily: 'OxaniumRegular',
                          ),
                        ),
                        Text(
                          "₹${cartController.totalAmount.toString()}",
                          style: const TextStyle(
                              fontFamily: 'OxaniumLight',
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalListCards extends StatefulWidget {
  final int index;
  final Event event;

  const FinalListCards({
    super.key,
    required this.index,
    required this.event,
  });

  @override
  State<FinalListCards> createState() => _FinalListCardsState();
}

class _FinalListCardsState extends State<FinalListCards> {
  final CartController controller = Get.put(CartController());
  bool startAnimation = false;
  final StepperController ctr = Get.put(StepperController());
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
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 500 + (widget.index * 100),
      ),
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const CircleAvatar(
                      radius: 30,
                      // child: Image(
                      //   image: AssetImage('assets/wallstreet.8165edf9.png'),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "      ${widget.event.eventName.toString()}",
                        style: const TextStyle(
                          fontFamily: 'OxaniumLight',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Text(
                "Event Price : ₹${widget.event.price.toString()}",
                style: const TextStyle(
                  fontFamily: 'OxaniumLight',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
