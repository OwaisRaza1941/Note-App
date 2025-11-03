import 'package:get/get.dart';
import 'package:notepad/controller/loader_controller.dart';
import 'package:notepad/data/local/db_helper.dart';
import 'package:notepad/models/notes_model.dart';

class NoteAddController extends GetxController {
  var allnotes = <NotesModel>[].obs;
  DBHelper? dbRF;

  final LoaderController loaderCtrl = Get.put(LoaderController());

  @override
  void onInit() {
    dbRF = DBHelper.getInstance;
    getNotes();
    super.onInit();
  }

  /// Fetch All Notes
  Future<void> getNotes() async {
    List<Map<String, dynamic>> rawData = await dbRF!.getAllNotes();
    allnotes.value = rawData.map((e) => NotesModel.fromMap(e)).toList();
  }

  /// Save Note Logic
  Future<void> saveNote(String title, String description, DateTime time) async {
    loaderCtrl.showLoader();

    // Prepare Note data
    NotesModel note = NotesModel(
      title: title,
      description: description,
      createdAt: time.millisecondsSinceEpoch,
    );

    // Insert into DB
    bool check = await dbRF!.addNote(note);

    // Refresh List + Back if success
    if (check) {
      await getNotes();
      await Future.delayed(Duration(seconds: 3));
      loaderCtrl.hideLoader();
      Get.back();
    } else {
      Get.snackbar("Error", "Failed to save note");
    }
  }
}
