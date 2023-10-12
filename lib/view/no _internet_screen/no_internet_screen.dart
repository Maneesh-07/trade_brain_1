import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain_1/controller/internet_check_controller.dart';
import 'package:trade_brain_1/view/bottom_navbar/bottom_navbar.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
        "assets/no internet.jpg",
        width: 200,
      )),
    );
  }
}

class InternetConnectionScreen extends StatelessWidget {
  InternetConnectionScreen({super.key});

  final InternetConnectionController connectionController =
      Get.put(InternetConnectionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (connectionController.isConnected.value) {
        return BottomNavScreen();
      } else {
        return const NoInternetScreen();
      }
    });
  }
}
