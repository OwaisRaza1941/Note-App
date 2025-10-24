import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/todo_add_controller.dart';
import 'package:notepad/views/screens/todo_add_screen.dart';
import 'package:notepad/views/widgets/bottom_sheets/custom_bottom_sheet.dart';
import 'package:notepad/views/widgets/cards/todo_cards.dart';
import 'package:notepad/views/widgets/textfields/text_fields.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoAddController todoCtrl = Get.put(TodoAddController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To-do',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.sort, color: Colors.white),
                ],
              ),
              SizedBox(height: 40),
              TextFields(),
              SizedBox(height: 20),

              Text(
                "Undated",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),

              Obx(() {
                return todoCtrl.allTodos.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: todoCtrl.allTodos.length,
                        itemBuilder: (context, index) {
                          return TodoCards(
                            index: index,
                            todo: todoCtrl.allTodos[index],
                            onLongPress: () {
                              showBottomOptions(
                                context: context,
                                index: index,
                                type: 'todo',
                              );
                            },
                          );
                        },
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: Text(
                            "No Todo Yets",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreyColor,
        shape: CircleBorder(),
        onPressed: () {
          Get.to(TodoAddScreen(isEdite: false, dateTime: DateTime.now()));
        },
        child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
