// custom_loader.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:notepad/controller/loader_controller.dart';

class CustomLoader extends StatelessWidget {
  final bool isEdite;
  CustomLoader({super.key, required this.isEdite});

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

                // Loader
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(height: 12),
                      Text(
                        isEdite ? 'Updated Note...' : 'Saving Note....',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : SizedBox();
    });
  }
}
