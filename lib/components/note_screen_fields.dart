import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';

TextField noteScreenFields({
  required String hintText,
  required double hintTextSize,
  required double textSize,
  required TextEditingController controller,
  int? maxLines,
  bool isTitle = false,
}) {
  return TextField(
    controller: controller,
    style: TextStyle(fontSize: textSize, color: Colors.white),
    cursorColor: Colors.white,
    maxLines: isTitle ? 1 : maxLines,
    textInputAction: isTitle ? TextInputAction.done : TextInputAction.newline,
    keyboardType: isTitle ? TextInputType.text : TextInputType.multiline,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: hintTextSize,
        color: AppColors.lightGreyColor,
      ),
      border: InputBorder.none,
    ),
  );
}
