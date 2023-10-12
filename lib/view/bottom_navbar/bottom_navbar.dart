import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain_1/controller/bottomnav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomnavController controller = Get.put(BottomnavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => controller.currentScreen),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              controller.changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: 'Watchlist',
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
            ],
          )),
    );
  }
}
