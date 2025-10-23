import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/note_add_controller.dart';

final NoteAddController controller = Get.put(NoteAddController());

showBottomOptions(int index, BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.2),
    elevation: 0,
    builder: (_) {
      return ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 100,
            color: Colors.black.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Delete button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.iconColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        bool check = await controller.dbRF!.deleteNote(
                          s_no: controller.allnotes[index].sNo!,
                        );

                        if (check) {
                          controller.getNotes();
                          Get.back();
                        }
                      },
                    ),
                    Text("Delete", style: TextStyle(color: Colors.white)),
                  ],
                ),

                // Move button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.drive_file_move,
                        color: AppColors.iconColor,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    Text("Move", style: TextStyle(color: Colors.white)),
                  ],
                ),

                // Edit button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: AppColors.iconColor,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    Text("Edit", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
