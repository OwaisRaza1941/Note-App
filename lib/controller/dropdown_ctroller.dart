import 'package:get/get.dart';

class DropDownController extends GetxController {
  var noteList = ['All Notes', 'Todo Notes', 'Recently Delete'];
  var selectedValue = 'All Notes'.obs;

  void updatedValue(String newValue) {
    selectedValue.value = newValue;
  }
}
