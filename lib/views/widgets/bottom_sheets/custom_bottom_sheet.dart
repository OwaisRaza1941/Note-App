import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/views/widgets/dialogs/delete_note_dialog.dart';
import 'package:notepad/views/widgets/dialogs/delete_todo_dailoge.dart';

showBottomOptions({
  required int index,
  required BuildContext context,
  required String type,
}) {
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
                // ✅ DELETE BUTTON
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.iconColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (type == "note") {
                          deleteNoteDailog(index);
                        } else if (type == "todo") {
                          deleteTodoDialog(index);
                        }
                      },
                    ),
                    Text("Delete", style: TextStyle(color: Colors.white)),
                  ],
                ),

                // MOVE
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

                // EDIT
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
