import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/controller/note_add_controller.dart';
import 'package:notepad/controller/searching_controller.dart';
import 'package:notepad/views/screens/note_add_screen.dart';
import 'package:notepad/views/widgets/bottom_sheets/custom_bottom_sheet.dart';
import 'package:notepad/views/widgets/cards/note_cards.dart';
import 'package:notepad/views/widgets/textfields/dropdown_button.dart';
import 'package:notepad/views/widgets/textfields/text_fields.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteAddController noteCtrl = Get.put(NoteAddController());
    final SearchingController searchCtrl = Get.put(SearchingController());

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
                var notesToShow = searchCtrl.searchText.isEmpty
                    ? noteCtrl.allnotes
                    : searchCtrl.filteredNotes;

                return notesToShow.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notesToShow.length,
                        itemBuilder: (context, index) {
                          return NoteCard(
                            note: notesToShow[index],
                            onLongPress: () {
                              showBottomOptions(
                                context: context,
                                index: index,
                                type: 'note',
                              );
                            },
                          );
                        },
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: Text(
                            "No Notes Found",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
          Get.to(NoteAddScreen(dateTime: DateTime.now(), isEdite: false));
        },
        child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
