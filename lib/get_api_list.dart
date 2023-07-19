import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class GetApiScreen extends StatelessWidget {
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX API Example'),
      ),
      body: Obx(
        () => _userController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _userController.users.value.data!.length,
                itemBuilder: (context, index) {
                  final user = _userController.users.value.data![index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6,),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
