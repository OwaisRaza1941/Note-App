import 'package:flutter/material.dart';
import 'package:notepad/components/note_screen_fields.dart';
import 'package:notepad/constants/colors.dart';

class NoteTitleSection extends StatelessWidget {
  final TextEditingController titleController;
  final String formattedDate;
  final String formattedTime;

  const NoteTitleSection({
    required this.titleController,
    required this.formattedDate,
    required this.formattedTime,
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
            controller: titleController,
            hintText: 'Title',
            hintTextSize: 30,
            textSize: 24,
            isTitle: true,
          ),
          Text(
            "$formattedDate | $formattedTime",
            style: TextStyle(color: AppColors.lightGreyColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
