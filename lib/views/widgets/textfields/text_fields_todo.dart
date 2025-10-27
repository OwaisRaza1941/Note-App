import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/searching_todos_controller.dart';

class TextFieldsClass extends StatelessWidget {
  const TextFieldsClass({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchingTodosController searchCtrl = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: (value) {
          searchCtrl.search(value);
        },
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
