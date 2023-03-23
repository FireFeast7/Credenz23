import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/custom_button.dart';
import 'package:flutter_application_1/models/event.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/views/cartpage.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';

class EventsList extends StatefulWidget {
  EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  final controller = Get.put(StepperController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() => ListView.builder(
                  itemBuilder: (context, index) => AllEvents(
                    index: index,
                  ),
                  itemCount: Event.events.length,
                  shrinkWrap: true,
                )),
          ),
          ElevatedButton(
            style: ButtonStyle(
              overlayColor: ButtonStyles.buttonColor,
            ),
            onPressed: () {
              Get.to(() => CartPage());
            },
            child: Text("Go to Cart"),
          ),
        ],
      ),
    );
  }
}

class AllEvents extends StatelessWidget {
//  final StepperController controller = Get.find();
  final cartController = Get.put(CartController());
  final int index;

  AllEvents({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = Event.events[index];

    return Obx(() => Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event.eventName),
              Text(event.price.toString()),
              IconButton(
                onPressed: cartController.selectedEvent.contains(event)
                    ? null
                    : () {
                        cartController.addEvent(event);
                      },
                icon: const Icon(Icons.add),
                color: cartController.selectedEvent.contains(event)
                    ? Colors.grey
                    : null,
              ),
            ],
          ),
        ));
  }
}
// class EventsList extends StatelessWidget {
//   final CartController productList = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: Event.events.length,
//           itemBuilder: (BuildContext context, int index) {
//             final product = Event.events[index];
//             return ListTile(
//               title: Text(product.eventName),
//               subtitle: Text('Price: \$${product.price}'),
//               trailing: _buildButton(product),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: ElevatedButton(
//           onPressed: () {
//             Get.to(() => CartPage());
//           },
//           child: Text('Cart')),
//     );
//   }

//   Widget _buildButton(Event product) {
//     if (CartController().selectedEvent.contains(product)) {
//       return const TextButton(
//         onPressed: null,
//         child: Text('Added to Cart'),
//       );
//     } else {
//       return ElevatedButton(
//         onPressed: () {
//           CartController().addEvent(product);
//         },
//         child: const Text('Add to Cart'),
//       );
//     }
//   }
// }
