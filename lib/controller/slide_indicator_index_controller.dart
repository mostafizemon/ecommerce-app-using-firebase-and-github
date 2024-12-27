import 'package:get/get.dart';

class SliderController extends GetxController {
  RxInt activeIndex = 0.obs;

  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }
}
