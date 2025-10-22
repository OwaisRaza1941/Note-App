import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';

TextField noteScreenFields({
  required String hintText,
  required double hintTextSize,
  required double textSize,
  int? maxLines,
  bool isTitle = false, // ✅ NEW
}) {
  return TextField(
    style: TextStyle(fontSize: textSize, color: Colors.white),
    cursorColor: Colors.white,
    maxLines: isTitle ? 1 : maxLines, // ✅ Title force single line
    textInputAction: isTitle
        ? TextInputAction.done
        : TextInputAction.newline, // ✅ Stop Enter on Title
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
