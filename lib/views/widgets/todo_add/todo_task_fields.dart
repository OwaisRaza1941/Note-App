import 'package:flutter/material.dart';
import 'package:notepad/components/note_screen_fields.dart';
import 'package:notepad/constants/colors.dart';

class TodoTaskFields extends StatelessWidget {
  final String fomateDate;
  final String formateTime;
  final TextEditingController taskController;

  const TodoTaskFields({
    required this.fomateDate,
    required this.formateTime,
    required this.taskController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          noteScreenFields(
            hintText: "Task",
            hintTextSize: 30,
            textSize: 24,
            isTitle: true,
            controller: taskController,
          ),
          Text(
            '$fomateDate | $formateTime',
            style: TextStyle(color: AppColors.lightGreyColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
