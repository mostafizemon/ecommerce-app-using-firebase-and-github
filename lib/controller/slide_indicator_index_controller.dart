import 'package:get/get.dart';

class SliderController extends GetxController {
  RxInt activeIndex = 0.obs;
  RxInt activeIndexProductsdetails = 0.obs;

  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }
  void updateActionIndexProductsdetails(int index) {
    activeIndexProductsdetails.value = index;
  }
}
