import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/todo_add_controller.dart';

final TodoAddController controller = Get.put(TodoAddController());

Future<dynamic> deleteTodoDialog(int index) {
  return Get.dialog(
    Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Do you want to delete this Todo perminantly!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    bool check = await controller.dbRF!.deleteTodo(
                      id: controller.allTodos[index].id!,
                    );

                    if (check) {
                      await controller.getTodos();
                      Get.back();
                    }
                  },
                  child: Text("Yes"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
