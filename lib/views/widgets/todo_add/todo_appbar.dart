import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/constants/styles.dart';

class TodoAppbar extends StatelessWidget {
  final VoidCallback onSave;
  const TodoAppbar({required this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
            Text('Todo', style: Styles.headingsTextStyle),
          ],
        ),

        IconButton(
          onPressed: onSave,
          icon: Icon(Icons.save_as_sharp, color: Colors.white),
        ),
      ],
    );
  }
}
