import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad/models/notes_model.dart';
import 'package:notepad/views/screens/note_add_screen.dart';

class NoteCard extends StatelessWidget {
  final NotesModel note;
  final Function() onLongPress;

  const NoteCard({Key? key, required this.note, required this.onLongPress})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          NoteAddScreen(
            dateTime: DateTime.fromMillisecondsSinceEpoch(note.createdAt!),
            note: note,
            isEdite: true,
          ),
        );
      },
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              note.title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              note.createdAt != null
                  ? DateFormat('dd MMM yyyy, hh:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(note.createdAt!),
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
