import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:openai_dart/openai_dart.dart';

class OpenAIService extends GetxService {
  late OpenAIClient client;

  Future<OpenAIService> init() async {
    var key = dotenv.get("OPENAI_API_KEY");
    OpenAI.apiKey = key;
    client = OpenAIClient(apiKey: key);

    var models = await OpenAI.instance.model.list();

    for (var element in models) {
      log("Model: $element");
    }

    return this;
  }

  Future<Map<String, dynamic>> analyzeImage({
    // required String imageUrl,
    required File image,
  }) async {
    try {
      // var base64img = await getImageAsBase64(imageFile);

//       String prompt = '''
// Analyze the following image of food and return the nutritional information in JSON format with the exact structure provided below. Focus on accurately identifying the specific name of the food item, including any recognizable details (e.g., "Grilled Chicken Salad", "Avocado Toast with Eggs", "Spaghetti Carbonara") to distinguish it from similar items. If exact information is not clear, use general knowledge of similar foods to make the best possible estimate. Respond **only** with the JSON format (no additional text or explanation).

// {
//   "name": "String - The specific name of the food item, including preparation style or notable ingredients, if identifiable (e.g., 'Grilled Chicken Salad')",
//   "calories": int - The estimated calories per serving in kcal. If unknown, provide a reasonable estimate based on similar foods,
//   "protein": double - The estimated protein content in grams. Provide a best-guess estimate if exact information is unavailable,
//   "carbohydrates": double - The estimated carbohydrates content in grams. Estimate based on similar foods if necessary,
//   "fat": double - The estimated total fat content in grams. Approximate if exact details are unclear,
//   "fiber": double - Estimated fiber content in grams. Estimate if unknown,
//   "sugar": double - Estimated sugar content in grams. Provide an estimate if exact information is not available,
//   "sodium": double - Estimated sodium content in milligrams. Approximate if needed,
//   "servingSize": double - The estimated serving size in grams or ml. Use a typical serving size if the exact size is unclear,
//   "servingUnit": "String - The unit of serving size, e.g., 'g' or 'ml'"
// }

// Important:
// - Focus on specificity for the "name" field, using all available clues. Identify if it’s a common dish (like "Caesar Salad" instead of just "Salad") and describe it as precisely as possible.
// - If any value is unknown, provide your best-guess estimate based on general knowledge of similar foods. Do not respond with "I don't know" or any message outside the JSON format.
// ''';

      String prompt = '''
```base64
${base64Encode(image.readAsBytesSync())}
```

Analyze the Base 64 Image above, then analyze the food and provide the nutritional information in JSON format **only**. Do not include any text, explanations, or commentary outside of the JSON response. Follow the exact JSON structure below.

{
  "name": String - The specific name of the food item, including preparation style or notable ingredients, if identifiable (e.g., 'Grilled Chicken Salad'),
  "calories": int - The estimated calories per serving in kcal. If unknown, provide a reasonable estimate based on similar foods,
  "protein": double - The estimated protein content in grams. Provide a best-guess estimate if exact information is unavailable,
  "carbohydrates": double - The estimated carbohydrates content in grams. Estimate based on similar foods if necessary,
  "fat": double - The estimated total fat content in grams. Approximate if exact details are unclear,
  "fiber": double - Estimated fiber content in grams. Estimate if unknown,
  "sugar": double - Estimated sugar content in grams. Provide an estimate if exact information is not available,
  "sodium": double - Estimated sodium content in milligrams. Approximate if needed,
  "servingSize": double - The estimated serving size in grams or ml. Use a typical serving size if the exact size is unclear,
  "servingUnit": String - The unit of serving size, e.g., 'g' or 'ml'
}

**Important**:
- Respond with **only** the JSON structure shown above. Do not include any additional text.
- Focus on accurately identifying the food name.
- If any value is unknown, provide your best-guess estimate based on similar foods rather than omitting the field.
- Do not return "I don't know" or any message outside of this JSON format.
''';

      final res = await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: const ChatCompletionModel.model(ChatCompletionModels.gpt4o),
          temperature: 0.7,
          messages: [
            ChatCompletionMessage.system(content: prompt),
            const ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.parts(
                [
                  ChatCompletionMessageContentPart.text(
                    text: 'Analyze the food in the Base64 image Above',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      log("${res.choices.first.message.content}");

      return {};
    } catch (e) {
      log("Error: $e");
      rethrow;
    } finally {}
  }

  Future<List<int>> getImageAsBytes(File imageFile) async {
    return await imageFile.readAsBytes();
  }

  Future<String> getImageAsBase64(File imageFile) async {
    List<int> imageBytes = await getImageAsBytes(imageFile);
    return base64Encode(imageBytes);
  }
}
