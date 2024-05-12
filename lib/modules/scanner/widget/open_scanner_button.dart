import 'package:diyetapps/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenScannerButton extends StatelessWidget {
  const OpenScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.toNamed(AppRoutes.scanner),
      icon: const Icon(Icons.document_scanner_outlined),
    );
  }
}
