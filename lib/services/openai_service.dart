import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio_service;
import 'package:get/get.dart';

class OpenAIService extends GetxService {
  final String _url = "https://api.openai.com/v1/food-detection";

  Future<OpenAIService> init() async {
    return this;
  }

  Future<Map<String, dynamic>> analyzeImage({required File imageFile}) async {
    final dio = dio_service.Dio();

    dio_service.FormData formData = dio_service.FormData.fromMap({
      'file': await dio_service.MultipartFile.fromFile(imageFile.path),
    });

    try {
      final response = await dio.post(_url, data: formData);
      return response.data;
    } on dio_service.DioException catch (e) {
      if (e.response != null) {
        log('Dio error!');
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
        return {'error': e.response?.data};
      } else {
        log('Error sending request: $e');
        return {'error': e.message};
      }
    }
  }
}
