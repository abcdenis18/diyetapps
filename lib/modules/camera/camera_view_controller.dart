import 'dart:developer';
import 'dart:io';
import 'package:diyetapps/services/openai_service.dart';
import 'package:diyetapps/services/supabase.dart';
import 'package:path/path.dart' show join;
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class CameraViewController extends GetxController {
  final OpenAIService _openAIService = Get.find();
  final SupabaseService _supabaseService = Get.find();

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

  // Future<void> takePicture() async {
  //   try {
  //     await initializeControllerFuture;
  //     final image = await cameraController.takePicture();
  //     final directory = await getApplicationDocumentsDirectory();
  //     String fileName = "${DateTime.now()}.jpeg";
  //     final imagePath = join(directory.path, fileName);
  //     await image.saveTo(imagePath);

  //     takedImage(File(image.path));

  //     // final uploadedImage = await _supabaseService.uploadImage(
  //     //   takedImage.value!,
  //     //   "images",
  //     //   fileName,
  //     // );

  //     final response =
  //         await _openAIService.analyzeImage(image: takedImage.value!);

  //     if (response.isNotEmpty) {
  //       log("Result: $response");
  //     }

  //     // if (uploadedImage != null) {
  //     //   final response =
  //     //       await _openAIService.analyzeImage(imageUrl: uploadedImage);

  //     //   if (response.isNotEmpty) {
  //     //     log("Result: $response");
  //     //   }
  //     // }
  //   } catch (e) {
  //     log("Error taking picture: $e");
  //   }
  // }

  Future<void> takePicture() async {
    try {
      await initializeControllerFuture;
      final image = await cameraController.takePicture();
      final directory = await getApplicationDocumentsDirectory();
      String fileName = "${DateTime.now()}.jpeg";
      final imagePath = join(directory.path, fileName);

      // Load the captured image as bytes
      final originalImageBytes = await File(image.path).readAsBytes();

      // Decode the image to compress it
      img.Image? decodedImage = img.decodeImage(originalImageBytes);
      if (decodedImage == null) {
        throw Exception("Failed to decode image.");
      }

      // Compress the image (quality adjusted to 50%)
      final compressedImageBytes = img.encodeJpg(decodedImage, quality: 30);

      // Save the compressed image
      final compressedImageFile = File(imagePath)
        ..writeAsBytesSync(compressedImageBytes);

      takedImage(compressedImageFile);

      // Upload the compressed image
      // final uploadedImage = await _supabaseService.uploadImage(
      //   compressedImageFile,
      //   "images",
      //   fileName,
      // );

      // If the upload is successful, analyze the image with OpenAI
      // if (uploadedImage != null) {
      //   Future.delayed(const Duration(seconds: 1), () async {
      //     final response = await _openAIService.analyzeImage(
      //       // imageUrl: uploadedImage,
      //       image: compressedImageFile,
      //     );

      //     if (response.isNotEmpty) {
      //       log("Result: $response");
      //     }
      //   });
      // }

      final response = await _openAIService.analyzeImage(
        // imageUrl: uploadedImage,
        image: compressedImageFile,
      );

      if (response.isNotEmpty) {
        log("Result: $response");
      }
    } catch (e) {
      log("Error taking picture: $e");
    }
  }
}
