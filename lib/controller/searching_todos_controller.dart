import 'package:get/get.dart';
import 'package:notepad/controller/todo_add_controller.dart';
import 'package:notepad/models/todo_model.dart';

class SearchingTodosController extends GetxController {
  var filteredTodos = <TodoModel>[].obs;
  var searchText = ''.obs;

  late TodoAddController todoCtrl;

  @override
  void onInit() {
    super.onInit();
    todoCtrl = Get.find<TodoAddController>();
  }

  void search(String query) {
    searchText.value = query;

    if (query.isNotEmpty) {
      filteredTodos.value = todoCtrl.allTodos
          .where(
            (todos) =>
                todos.task != null &&
                todos.task!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredTodos.value = todoCtrl.allTodos;
    }
  }
}
