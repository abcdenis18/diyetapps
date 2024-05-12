import 'dart:developer';
import 'dart:io';
import 'package:diyetapps/services/openai_service.dart';
import 'package:path/path.dart' show join;
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class CameraViewController extends GetxController {
  final OpenAIService _openAIService = Get.find();
  late CameraDescription _camera;
  late CameraController cameraController;
  Future<void>? initializeControllerFuture;
  var takedImage = Rxn<File>();

  @override
  void onInit() {
    _initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  void _initCamera() async {
    _camera = (await availableCameras()).first;

    cameraController = CameraController(
      _camera,
      ResolutionPreset.high,
    );
    initializeControllerFuture = cameraController.initialize();

    update();
  }

  Future<void> takePicture() async {
    try {
      await initializeControllerFuture;
      final image = await cameraController.takePicture();
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = join(directory.path, '${DateTime.now()}.png');
      await image.saveTo(imagePath);

      takedImage(File(image.path));

      final response =
          await _openAIService.analyzeImage(imageFile: takedImage.value!);

      if (response.isNotEmpty) {
        log("Result: $response");
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => AnalyzeScreen(imagePath: imagePath),
      //   ),
      // );
    } catch (e) {
      log("Error taking picture: $e");
    }
  }
}
