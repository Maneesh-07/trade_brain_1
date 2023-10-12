import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:trade_brain_1/view/no%20_internet_screen/no_internet_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 7),
      () {
        Get.off(() => InternetConnectionScreen());
      },
    );

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/Animation - 1696948432296.json",
              width: 180,
            ),
            const SizedBox(
              height: 40,
            ),
            Lottie.asset(
              "assets/Animation_logo.json",
              width: 180,
            )
          ],
        ),
      ),
    );
  }
}
