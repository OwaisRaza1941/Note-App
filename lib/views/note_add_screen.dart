import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:notepad/components/note_screen_fields.dart';
import 'package:notepad/constants/colors.dart';

class NoteAddScreen extends StatelessWidget {
  final DateTime dateTime;

  const NoteAddScreen({required this.dateTime, super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "Notes",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),

                  Icon(Icons.check, color: Colors.white),
                ],
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    noteScreenFields(
                      hintText: 'Title',
                      hintTextSize: 30,
                      textSize: 24,
                      isTitle: true,
                    ),

                    Text(
                      "$formattedDate | $formattedTime",
                      style: TextStyle(
                        color: AppColors.lightGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: noteScreenFields(
                  hintText: 'Note something down',
                  hintTextSize: 15,
                  textSize: 18,
                  maxLines: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
