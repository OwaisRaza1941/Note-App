// custom_loader.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:notepad/controller/loader_controller.dart';

class CustomLoader extends StatelessWidget {
  CustomLoader({super.key});

  final loaderController = Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return loaderController.isLoading.value
          ? Stack(
              children: [
                // Background blur + dim
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),

                // Loader Box
                Center(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.purple,
                          size: 50,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Saving note...",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : SizedBox();
    });
  }
}
