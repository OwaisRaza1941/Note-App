import 'package:flutter/material.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/views/widgets/text_fields.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To-do',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.sort, color: Colors.white),
                ],
              ),
              SizedBox(height: 40),
              TextFields(),
              SizedBox(height: 20),
              Text("Undated", style: TextStyle(color: Colors.grey)),
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
