import 'package:get/get.dart';
import 'package:notepad/controller/note_add_controller.dart';
import 'package:notepad/models/notes_model.dart';

class SearchingController extends GetxController {
  var filteredNotes = <NotesModel>[].obs;
  RxString searchText = ''.obs;

  late NoteAddController noteCtrl;

  @override
  void onInit() {
    super.onInit();
    noteCtrl = Get.find<NoteAddController>();
  }

  void search(String query) {
    searchText.value = query;

    if (query.isNotEmpty) {
      filteredNotes.value = noteCtrl.allnotes
          .where(
            (note) =>
                note.title != null &&
                note.title!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredNotes.value = noteCtrl.allnotes;
    }
  }
}
