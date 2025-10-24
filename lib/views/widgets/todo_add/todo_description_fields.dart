import 'package:flutter/material.dart';
import 'package:notepad/components/note_screen_fields.dart';

class TodoDescriptionFields extends StatelessWidget {
  final TextEditingController contentController;
  const TodoDescriptionFields({required this.contentController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: noteScreenFields(
        hintText: 'Todo something down',
        hintTextSize: 15,
        textSize: 18,
        maxLines: 24,
        controller: contentController,
        isTitle: false,
      ),
    );
  }
}
