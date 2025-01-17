import 'package:get/get.dart';

class CartController extends GetxController {
  RxDouble totalAmount = 0.0.obs;

  void updateTotalAmount(double newAmount) {
    totalAmount.value = newAmount;
  }
}
