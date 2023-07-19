import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

class AddRemoveList extends GetxController {
  RxList<String> fruitList = [
    "apple",
    "banana",
    'mango',
    "orange",
  ].obs;

  RxList favList = [].obs;

  addFav(String value) {
    favList.add(value);
  }

  removeFav(String value) {
    favList.remove(value);
  }
}

class imagePick extends GetxController {
  RxString imagePath = ''.obs;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}

class AddUser extends GetxController {
  final userList = <Map<String, dynamic>>[
    {'name': 'Test', 'age': 25},
  ].obs;
  void addUser(String name, int age) {
    userList.add({'name': name, 'age': age});
  }

  void removeUser(int index) {
    userList.removeAt(index);
  }
}
