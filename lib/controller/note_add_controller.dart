import 'package:get/get.dart';
import 'package:notepad/data/local/db_helper.dart';
import 'package:notepad/models/notes_model.dart';

class NoteAddController extends GetxController {
  var allnotes = <NotesModel>[].obs;

  DBHelper? dbRF;

  getNotes() async {
    List<Map<String, dynamic>> rawData = await dbRF!.getAllNotes();
    allnotes.value = rawData.map((e) => NotesModel.fromMap(e)).toList();
  }

  @override
  void onInit() {
    dbRF = DBHelper.getInstance;
    getNotes();
    super.onInit();
  }
}
