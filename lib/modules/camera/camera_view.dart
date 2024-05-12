import 'package:camera/camera.dart';
import 'package:diyetapps/modules/camera/camera_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CameraViewController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: controller.initializeControllerFuture == null
                    ? const SizedBox()
                    : FutureBuilder<void>(
                        future: controller.initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CameraPreview(controller.cameraController);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: controller.takePicture,
          //   child: const Icon(Icons.camera_alt),
          // ),
        );
      },
    );
  }
}
