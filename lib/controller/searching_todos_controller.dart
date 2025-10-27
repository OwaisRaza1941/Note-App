import 'package:get/get.dart';
import 'package:notepad/data/local/db_helper.dart';
import 'package:notepad/models/todo_model.dart';

class SearchingTodosController extends GetxController {
  var allTodosData = <TodoModel>[].obs;
  var filteredTodos = <TodoModel>[].obs;
  var searchText = ''.obs;

  Future<void> loadFromTodos() async {
    List<Map<String, dynamic>> todos = await DBHelper.getInstance.getAllTodos();
    allTodosData.clear();
    allTodosData.addAll(todos.map((e) => TodoModel.fromMap(e)).toList());
  }

  void search(String query) {
    searchText.value = query;

    if (query.isNotEmpty) {
      filteredTodos.value = allTodosData
          .where(
            (todos) =>
                todos.task != null && todos.task!.toLowerCase().contains(query),
          )
          .toList();
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadFromTodos();
  }
}
