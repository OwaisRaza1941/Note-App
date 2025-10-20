import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';

class TextFields extends StatelessWidget {
  const TextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorClass.darkGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
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
