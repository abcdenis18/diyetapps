import 'package:diyetapps/routes/app_pages.dart';
import 'package:diyetapps/routes/app_routes.dart';
import 'package:diyetapps/services/openai_service.dart';
import 'package:diyetapps/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  
  await Get.putAsync(() => OpenAIService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diyet Apps',
      debugShowCheckedModeBanner: false,
      theme: appThemeLight,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
