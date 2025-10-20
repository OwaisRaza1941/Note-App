import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/dropdown_ctroller.dart';

class DropdownButtonClass extends StatelessWidget {
  const DropdownButtonClass({super.key});

  @override
  Widget build(BuildContext context) {
    DropDownController dropDownCtrl = Get.put(DropDownController());

    return Obx(() {
      return DropdownButton2<String>(
        underline: SizedBox(),
        value: dropDownCtrl.selectedValue.value,
        items: dropDownCtrl.noteList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            .toList(),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(color: Colors.transparent),
          elevation: 0,
        ),
        onChanged: (value) {
          dropDownCtrl.updatedValue(value!);
        },
      );
    });
  }
}
