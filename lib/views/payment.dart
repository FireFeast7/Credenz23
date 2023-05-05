import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/views/upi.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/custom_button.dart';

class PaymentView extends StatelessWidget {
  String payee = 'Generate A new Link ';
  final CartController cartController = Get.put(CartController());
  final PaymentController pay = Get.put(PaymentController());
  Future<String> getPaymentLink() async {
    String uplink =
        'upi://pay?pa=pictscholarship@jsb&pn=pictscholarship&am=${cartController.totalAmount.toString()}&tn=Credenz%20IEEE&cu=INR';
    return uplink;
  }

  PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: const Center(
            child: Text(
              'Payment',
              style: TextStyle(
                fontFamily: 'Mars Bold',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Obx(() => Center(
                child: pay.showlink.value
                    ? GestureDetector(
                        child: Text(payee),
                        onTap: () async {
                          pay.payment.value = await getPaymentLink();
                          payee = pay.payment.value;
                          Uri url = Uri.parse(pay.payment.value);
                          print(url);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could Not open the link';
                          }
                        },
                      )
                    : AnimatedButton(
                        icon: Icons.link,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.6,
                        pressEvent: () {
                          AwesomeDialog(
                            context: context,
                            keyboardAware: true,
                            dismissOnBackKeyPress: false,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            btnCancelText: "Cancel",
                            btnOkText: "Yes, I will pay",
                            title: 'Continue to pay?',
                            desc:
                                "Please confirm that you will pay ₹${cartController.totalAmount.toString()} using the Link",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              pay.payment.value = await getPaymentLink();
                              payee = pay.payment.value;
                              Uri url = Uri.parse(pay.payment.value);
                              print(url);

                              Get.find<PaymentController>().showQR.value = true;
                              pay.showlink.value = true;
                            },
                          ).show();
                        },
                        text: 'Generate Payment Link',
                      ),
              )),
        ),
        Container(
          margin: const EdgeInsets.only(top: 13),
          //      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (Get.find<PaymentController>().showQR.value) {
                      return Colors.blue;
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: Text('To Google Pay'),
              onPressed: () async {
                if (Get.find<PaymentController>().showQR.value == true) {
                  pay.isTextFieldEnabled.value = true;
                  pay.payment.value = await getPaymentLink();
                  Uri url = Uri.parse(pay.payment.value);
                  print(url.toString());
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could Not open the link';
                  }
                } else {
                  return;
                }
                //            Get.to(() => UpiPage());
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        ),
      ],
    );
  }
}


// Widget showText(BuildContext context) {
//   final CartController cartController = Get.put(CartController());

//   if (Get.find<PaymentController>().showQR.value == false) {
//     return ElevatedButton(
//         style: ButtonStyle(
//           overlayColor: ButtonStyles.buttonColor,
//         ),
//         onPressed: () {},
//         child: Text('Pay Here'));
//   } else {
//     return ElevatedButton(
//       style: ButtonStyle(
//         overlayColor: ButtonStyles.buttonColor,
//       ),
//       onPressed: () {
//         Get.find<PaymentController>().showQR.value = false;
//       },
//       child: Text('Pay By Another Method'),
//     );
//   }
// }
