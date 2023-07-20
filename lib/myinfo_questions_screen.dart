import 'package:first_getx_project/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({super.key});

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  DropDownController dropdownValue = Get.put(DropDownController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Info Page"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Welcome, Mark",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue[200]),
                child: Center(
                  child: Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue.selectedValue.value,
                        items: dropdownValue.items
                            .asMap()
                            .entries
                            .map((entry) => DropdownMenuItem<String>(
                                  value: entry.value,
                                  child: Text(
                                    entry.value,
                                    style: TextStyle(
                                      color: entry.key == 0
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          dropdownValue
                              .updateSelectedValue(newValue.toString());
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue.selectedValue1.value,
                        items: dropdownValue.items1
                            .asMap()
                            .entries
                            .map((entry) => DropdownMenuItem<String>(
                                  value: entry.value,
                                  child: Text(
                                    entry.value,
                                    style: TextStyle(
                                      color: entry.key == 0
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          dropdownValue
                              .updateSelectedValue1(newValue.toString());
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
