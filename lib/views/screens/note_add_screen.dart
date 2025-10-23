import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/note_add_controller.dart';
import 'package:notepad/views/animations/custom_loader.dart';
import 'package:notepad/views/widgets/note_add/add_screen_appbar.dart';
import 'package:notepad/views/widgets/note_add/note_description_fields.dart';
import 'package:notepad/views/widgets/note_add/note_title.dart';

class NoteAddScreen extends StatelessWidget {
  final DateTime dateTime;

  NoteAddScreen({required this.dateTime, super.key});

  final NoteAddController noteCtrl = Get.put(NoteAddController());

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddScreenAppBar(
                    onSave: () {
                      noteCtrl.saveNote(
                        titleController.text,
                        desController.text,
                        dateTime,
                      );
                    },
                  ),

                  SizedBox(height: 20),

                  NoteTitleSection(
                    formattedDate: formattedDate,
                    formattedTime: formattedTime,
                    titleController: titleController,
                  ),

                  NoteDescriptionField(desController: desController),
                ],
              ),
            ),
          ),

          CustomLoader(),
        ],
      ),
    );
  }
}
