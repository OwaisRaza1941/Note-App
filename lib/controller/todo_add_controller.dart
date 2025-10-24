import 'package:get/get.dart';
import 'package:notepad/controller/loader_controller.dart';
import 'package:notepad/data/local/db_helper.dart';
import 'package:notepad/models/todo_model.dart';

class TodoAddController extends GetxController {
  final LoaderController loaderController = Get.put(LoaderController());

  var allTodos = <TodoModel>[].obs;
  DBHelper? dbRF;

  Future<void> getTodos() async {
    final List<Map<String, dynamic>> rawData = await dbRF!.getAllTodos();

    allTodos.value = rawData.map((e) => TodoModel.fromMap(e)).toList();
  }

  /// Save Note Logic
  Future<void> saveTodo(String task, String content, DateTime dateTime) async {
    loaderController.showLoader();

    TodoModel todo = TodoModel(
      task: task,
      content: content,
      isComplete: 0,
      createdAt: dateTime.millisecondsSinceEpoch,
    );

    ///insert into DB
    bool check = await dbRF!.addTodo(todo);

    // Refresh List + Back if success
    if (check) {
      await getTodos();
      await Future.delayed(Duration(seconds: 3));
      loaderController.hideLoader();
      Get.back();
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    dbRF = DBHelper.getInstance;
    await getTodos();
  }
}
