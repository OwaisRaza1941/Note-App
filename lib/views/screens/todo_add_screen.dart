import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/loader_controller.dart';
import 'package:notepad/controller/todo_add_controller.dart';
import 'package:notepad/models/todo_model.dart';
import 'package:notepad/views/animations/custom_loader.dart';
import 'package:notepad/views/widgets/todo_add/todo_appbar.dart';
import 'package:notepad/views/widgets/todo_add/todo_description_fields.dart';
import 'package:notepad/views/widgets/todo_add/todo_task_fields.dart';

class TodoAddScreen extends StatelessWidget {
  final DateTime dateTime;
  final TodoModel? todos;
  final bool isEdite;

  const TodoAddScreen({
    required this.dateTime,
    this.todos,
    required this.isEdite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoaderController loaderController = Get.put(LoaderController());
    TodoAddController todoCtrl = Get.put(TodoAddController());

    String formateDate = DateFormat('dd MMM yyyy').format(dateTime);
    String fomateTime = DateFormat('hh:mm a').format(dateTime);

    TextEditingController taskController = TextEditingController(
      text: todos != null ? todos?.task ?? '' : null,
    );
    TextEditingController contentController = TextEditingController(
      text: todos != null ? todos?.content ?? '' : null,
    );

    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodoAppbar(
                    onSave: () async {
                      if (taskController.text.isEmpty ||
                          contentController.text.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Task and Conntent required!",
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          colorText: Color.fromARGB(255, 255, 255, 255),
                        );
                        return;
                      }
                      loaderController.showLoader();

                      if (isEdite) {
                        TodoModel todo = TodoModel(
                          id: todos!.id,
                          task: taskController.text,
                          content: contentController.text,
                          createdAt: todos!.createdAt,
                        );

                        await todoCtrl.dbRF!.updatedTodo(todo);
                        await todoCtrl.getTodos();

                        await Future.delayed(Duration(seconds: 3));
                        loaderController.hideLoader();
                        Get.back();
                      } else {
                        await todoCtrl.saveTodo(
                          taskController.text,
                          contentController.text,
                          dateTime,
                        );
                      }
                    },
                  ),

                  TodoTaskFields(
                    fomateDate: formateDate,
                    formateTime: fomateTime,
                    taskController: taskController,
                  ),

                  TodoDescriptionFields(contentController: contentController),
                ],
              ),
            ),
          ),
          CustomLoader(isEdite: isEdite),
        ],
      ),
    );
  }
}
