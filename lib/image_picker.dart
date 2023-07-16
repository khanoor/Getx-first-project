import 'dart:io';

import 'package:first_getx_project/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final imagePick imageController = Get.put(imagePick());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Image picker")),
          body: Obx(() {
            return Column(
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: imageController.imagePath.isNotEmpty
                        ? FileImage(File(imageController.imagePath.toString()))
                        : null),
                TextButton(
                    onPressed: () {
                      imageController.getImage();
                    },
                    child: Text("Pick Image"))
              ],
            );
          })),
    );
  }
}
