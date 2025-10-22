import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreenAppBar extends StatelessWidget {
  final VoidCallback onSave;

  const AddScreenAppBar({required this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
            SizedBox(width: 10),
            Text("Notes", style: TextStyle(fontSize: 25, color: Colors.white)),
          ],
        ),
        IconButton(
          onPressed: onSave,
          icon: Icon(Icons.save_as_rounded, color: Colors.white),
        ),
      ],
    );
  }
}
