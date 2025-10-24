import 'package:get/get.dart';
import 'package:notepad/models/notes_model.dart';

class SearchingController extends GetxController {
  var allnotesData = <NotesModel>[].obs;
  var filteredNotes = <NotesModel>[].obs;
  RxString searchText = ''.obs;

  void search(String query) {
    searchText.value = query;

    if (query.isNotEmpty) {
      filteredNotes.value = allnotesData
          .where(
            (note) => note.title!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredNotes.value = allnotesData;
    }
  }
}
