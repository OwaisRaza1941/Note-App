import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/views/widgets/dropdown_button.dart';
import 'package:notepad/views/widgets/text_fields.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonClass(),
              SizedBox(height: 10),
              TextFields(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorClass.darkGreyColor,
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
