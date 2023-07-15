import 'package:first_getx_project/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  AddRemoveList addrmv = Get.put(AddRemoveList());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("list example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount: addrmv.fruitList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                              onTap: () {
                                if (addrmv.favList.contains(
                                    addrmv.fruitList[index].toString())) {
                                  addrmv.removeFav(
                                      addrmv.fruitList[index].toString());
                                } else {
                                  addrmv.addFav(
                                      addrmv.fruitList[index].toString());
                                }
                              },
                              title: Text(addrmv.fruitList[index].toString()),
                              trailing: Obx(
                                () => Icon(Icons.favorite,
                                    color: addrmv.favList.contains(
                                            addrmv.fruitList[index].toString())
                                        ? Colors.red
                                        : Colors.white),
                              )),
                        );
                      }),
                ))
          ],
        ),
      ),
    ));
  }
}
