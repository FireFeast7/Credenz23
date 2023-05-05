import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/views/events_page.dart';
import 'package:get/get.dart';

import '../controllers/Cart_Controller.dart';

class TransactionId extends StatelessWidget {
  final cartController = Get.put(CartController());
  TransactionId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: AnimatedButton(
          pressEvent: () {
            AwesomeDialog(
              context: context,
              keyboardAware: true,
              dismissOnBackKeyPress: false,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              btnCancelText: "Select Events Again",
              btnOkText: "Enter Id",
              title: 'Transaction Successfull?',
              desc:
                  "Please confirm that you paid ₹${cartController.totalAmount.toString()} using the Link",
              btnCancelOnPress: () {
                Get.to(() => EventsList());
                //delete all the list values of cart
                //make payment 0 
                
              },
              btnOkOnPress: () {},
            ).show();
          },
          text: 'Transaction Successfull/Unsuccessfull',
        ),
      ),
    );
  }
}
