import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;

  incrementCounter() {
    counter.value++;
  }

  showToast() {
    Get.defaultDialog(title: "Test", middleText: "A to Z");
  }
}

class ChangeOpacity extends GetxController {
  RxDouble opacity = 0.3.obs;

  manageOpacity(double value) {
    opacity.value = value;
  }
}

class ChangeSwitch extends GetxController {
  RxBool isSwitch = false.obs;

  changeSwitchValue(bool value) {
    isSwitch.value = value;
  }
}
