import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/loader_controller.dart';
import 'package:notepad/controller/note_add_controller.dart';
import 'package:notepad/models/notes_model.dart';
import 'package:notepad/views/animations/custom_loader.dart';
import 'package:notepad/views/widgets/note_add/add_screen_appbar.dart';
import 'package:notepad/views/widgets/note_add/note_description_fields.dart';
import 'package:notepad/views/widgets/note_add/note_title.dart';

class NoteAddScreen extends StatelessWidget {
  final DateTime dateTime;

  NoteAddScreen({required this.dateTime, super.key});

  final NoteAddController noteCtrl = Get.find();
  final LoaderController loaderCtrl = Get.put(LoaderController());

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
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 60,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddScreenAppBar(
                    onSave: () async {
                      loaderCtrl.showLoader();

                      NotesModel notes = NotesModel(
                        title: titleController.text,
                        description: desController.text,
                      );

                      bool check = await noteCtrl.dbRF!.addNote(notes);

                      if (titleController.text.isEmpty ||
                          desController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("All Fildes Required")),
                        );
                      } else if (check) {
                        noteCtrl.getNotes();
                        await Future.delayed(Duration(seconds: 10));
                        Get.back();
                      }

                      loaderCtrl.hideLoader();
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
