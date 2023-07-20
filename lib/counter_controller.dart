import 'dart:convert';

import 'package:first_getx_project/list_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = UserModel(
          data: [],
          page: null,
          support: null,
          perPage: null,
          total: null,
          totalPages: null)
      .obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        users.value = UserModel.fromJson(jsonData);
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class DropDownController extends GetxController {
  final List<String> items = [
    'Question 1',
    'Answer on question 1',
  ];

  var selectedValue = 'Question 1'.obs;
  void updateSelectedValue(String newValue) {
    selectedValue.value = newValue;
  }

  final List<String> items1 = [
    'FAQ Test',
    'Hello World !',
  ];
  var selectedValue1 = 'FAQ Test'.obs;
  void updateSelectedValue1(String newValue) {
    selectedValue1.value = newValue;
  }
}
