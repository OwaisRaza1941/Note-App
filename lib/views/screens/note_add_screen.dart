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
  final NotesModel? note;
  final bool isEdite;

  NoteAddScreen({
    required this.dateTime,
    required this.isEdite,
    this.note,
    super.key,
  });

  final NoteAddController noteCtrl = Get.put(NoteAddController());
  final LoaderController loaderController = Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    TextEditingController titleController = TextEditingController(
      text: isEdite ? note?.title ?? "" : "",
    );

    TextEditingController desController = TextEditingController(
      text: isEdite ? note?.description ?? "" : "",
    );

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
                    onSave: () async {
                      if (titleController.text.isEmpty ||
                          desController.text.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Title and Description required!",
                          backgroundColor: Color.fromARGB(255, 75, 32, 3),
                          colorText: Color.fromARGB(255, 255, 255, 255),
                        );
                        return;
                      }

                      loaderController.showLoader();

                      if (isEdite) {
                        // --- UPDATE NOTE LOGIC ---
                        NotesModel updatedNote = NotesModel(
                          sNo: note!.sNo,
                          title: titleController.text,
                          description: desController.text,
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                        );

                        await noteCtrl.dbRF!.updateNote(updatedNote);
                        await noteCtrl.getNotes();
                      } else {
                        // --- SAVE NEW NOTE LOGIC ---
                        await noteCtrl.saveNote(
                          titleController.text,
                          desController.text,
                          dateTime,
                        );
                      }

                      await Future.delayed(Duration(seconds: 3));
                      loaderController.hideLoader();

                      Get.back();
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

          CustomLoader(isEdite: isEdite),
        ],
      ),
    );
  }
}
