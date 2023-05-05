import 'package:get/get.dart';

class StepperController extends GetxController {
  var currentpos = 0.obs;
  var complete = false.obs;

  final List<String> _continueText = ["Checkout", "Final Payment", "Pay Here"];
  final List<String> _cancelText = ["Events Page", "Events List", "Checkout"];
  String getcontinueText(int currentpos) {
    if (currentpos < _continueText.length) {
      return _continueText[currentpos];
    } else {
      return "Continue";
    }
  }

  String getCancelText(int currentPos) {
    if (currentPos < _cancelText.length) {
      return _cancelText[currentPos];
    }
    return "Cancel";
  }
}
