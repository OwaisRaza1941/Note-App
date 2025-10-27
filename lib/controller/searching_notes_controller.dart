import 'package:get/get.dart';
import 'package:notepad/data/local/db_helper.dart';
import 'package:notepad/models/notes_model.dart';

class SearchingController extends GetxController {
  var allnotesData = <NotesModel>[].obs;
  var filteredNotes = <NotesModel>[].obs;
  RxString searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotesFromDB();
  }

  void loadNotesFromDB() async {
    List<Map<String, dynamic>> notes = await DBHelper.getInstance.getAllNotes();
    allnotesData.clear();
    allnotesData.addAll(notes.map((e) => NotesModel.fromMap(e)).toList());
  }

  void search(String query) {
    searchText.value = query;

    if (query.isNotEmpty) {
      filteredNotes.value = allnotesData
          .where(
            (note) =>
                note.title != null &&
                note.title!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredNotes.value = allnotesData;
    }
  }
}
