import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/note_add_controller.dart';
import 'package:notepad/views/screens/note_add_screen.dart';
import 'package:notepad/views/widgets/dropdown_button.dart';
import 'package:notepad/views/widgets/text_fields.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteAddController noteCtrl = Get.put(NoteAddController());

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

              Obx(() {
                return noteCtrl.allnotes.isNotEmpty
                    ? GestureDetector(
                        onTap: () {},
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: noteCtrl.allnotes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                  top: 10,
                                ),
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreyColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  title: Text(
                                    noteCtrl.allnotes[index].title ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    noteCtrl.allnotes[index].createdAt != null
                                        ? DateFormat(
                                            'dd MMM yyyy, hh:mm a',
                                          ).format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              noteCtrl
                                                  .allnotes[index]
                                                  .createdAt!,
                                            ),
                                          )
                                        : '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "No Note Yets",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreyColor,
        shape: CircleBorder(),
        onPressed: () {
          Get.to(NoteAddScreen(dateTime: DateTime.now()));
        },
        child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
