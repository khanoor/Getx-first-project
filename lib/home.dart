import 'package:first_getx_project/counter_controller.dart';
import 'package:first_getx_project/listpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitch = false;
  double opacity = 0.3;
  final CounterController controller = Get.put(CounterController());
  final ChangeOpacity con = Get.put(ChangeOpacity());
  final ChangeSwitch cs = Get.put(ChangeSwitch());
  @override
  Widget build(BuildContext context) {
    print("object");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Obx(
          () => Text(controller.counter.toString()),
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(controller.counter.toString())),
              IconButton(
                  onPressed: () {
                    controller.showToast();
                  },
                  icon: Icon(Icons.ac_unit_outlined)),
              Obx(() => Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withOpacity(con.opacity.value))),
              Obx(
                () => Slider(
                    value: con.opacity.value,
                    onChanged: (value) {
                      // opacity = value;
                      con.manageOpacity(value);
                    }),
              ),
              Obx(
                () => Switch(
                    value: cs.isSwitch.value,
                    onChanged: (value) {
                      cs.changeSwitchValue(value);
                    }),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => ListPage());
                  },
                  icon: Icon(Icons.align_vertical_center_rounded)),
              IconButton(
                  onPressed: () {
                    Get.to(() => ImageScreen());
                  },
                  icon: Icon(Icons.swap_calls_outlined)),
              Spacer(),
              FloatingActionButton(onPressed: () {
                controller.incrementCounter();
                Icon(Icons.add);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
