import 'package:flutter/material.dart';
import 'package:notepad/components/note_screen_fields.dart';

class NoteDescriptionField extends StatelessWidget {
  final TextEditingController desController;

  const NoteDescriptionField({required this.desController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: noteScreenFields(
        controller: desController,
        hintText: 'Note something down',
        hintTextSize: 15,
        textSize: 18,
        maxLines: 24,
      ),
    );
  }
}
