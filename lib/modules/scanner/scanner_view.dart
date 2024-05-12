import 'package:diyetapps/modules/camera/camera_view.dart';
import 'package:diyetapps/modules/camera/camera_view_controller.dart';
import 'package:diyetapps/modules/scanner/widget/scanner_result_card.dart';
import 'package:diyetapps/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CameraView(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                        child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Scanning...',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 5,
                    child: Obx(() {
                      final CameraViewController cameraController = Get.find();
                      return Stack(
                        children: [
                          // Center(child: Text('Camera')),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: cameraController.takedImage.value == null
                                ? IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor: appColorPrimary),
                                    onPressed: () =>
                                        cameraController.takePicture(),
                                    icon: const Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                  )
                                : const ScannerResultCard(),
                          )
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
