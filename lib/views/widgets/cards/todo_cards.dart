import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/models/todo_model.dart';
import 'package:notepad/views/screens/todo_add_screen.dart';

class TodoCards extends StatelessWidget {
  final int? index;
  final TodoModel todo;
  final Function() onLongPress;
  const TodoCards({
    required this.index,
    required this.todo,
    required this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          TodoAddScreen(
            isEdite: true,
            todos: todo,
            dateTime: DateTime.fromMillisecondsSinceEpoch(todo.createdAt!),
          ),
        );
      },
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              todo.task ?? "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              todo.createdAt != null
                  ? DateFormat('dd MMM yyyy, hh:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(todo.createdAt!),
                    )
                  : "",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }
}
