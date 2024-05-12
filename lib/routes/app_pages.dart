import 'package:diyetapps/modules/detail/detail_view.dart';
import 'package:diyetapps/modules/home/home_view.dart';
import 'package:diyetapps/modules/scanner/scanner_view.dart';
import 'package:diyetapps/modules/splash/splash_binding.dart';
import 'package:diyetapps/modules/splash/splash_view.dart';
import 'package:diyetapps/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.scanner,
      page: () => const ScannerView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailView(),
    ),
  ];
}
