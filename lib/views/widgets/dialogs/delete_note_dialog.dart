import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/note_add_controller.dart';

final NoteAddController controller = Get.put(NoteAddController());

Future<dynamic> deleteNoteDailog(int index) {
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
              "Do you want to delete this Note perminantly!",
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
                    bool check = await controller.dbRF!.deleteNote(
                      s_no: controller.allnotes[index].sNo!,
                    );

                    if (check) {
                      controller.getNotes();
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
