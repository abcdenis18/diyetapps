import 'package:diyetapps/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _moveToHomeScreen();
  }

  void _moveToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }
}
