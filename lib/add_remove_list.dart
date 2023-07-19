import 'package:first_getx_project/counter_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TestListScreen extends StatefulWidget {
  const TestListScreen({super.key});

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends State<TestListScreen> {
  AddUser addRemoveUser = Get.put(AddUser());

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("list")),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    var nameController = TextEditingController();
                    var ageController = TextEditingController();
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            maxLength: 10,
                            autofocus: true,
                            controller: nameController,
                            decoration: InputDecoration(hintText: "name"),
                          ),
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: InputDecoration(
                              hintText: "age",
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            String name = nameController.text;
                            int age = int.tryParse(ageController.text) ?? 0;

                            addRemoveUser.addUser(name, age);
                            Get.back();
                          },
                          child: Text("add"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add)),
          SizedBox(
            height: 10,
          ),
          Obx(() => Expanded(
                child: ListView.builder(
                  itemCount: addRemoveUser.userList.length,
                  itemBuilder: (context, index) {
                    var user = addRemoveUser.userList[index];
                    var name = user['name'];
                    var age = user['age'];

                    return Card(
                      child: Column(
                        children: [
                          Text('Name: $name'),
                          Text('Age: $age'),
                          IconButton(
                              onPressed: () {
                                addRemoveUser.userList.removeAt(index);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    ));
  }
}
