import 'package:diyetapps/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerResultCard extends StatelessWidget {
  const ScannerResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Food Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.detail),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
