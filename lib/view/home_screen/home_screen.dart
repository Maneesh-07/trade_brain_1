import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain_1/controller/home_controller.dart';
import 'package:trade_brain_1/view/home_screen/widgets/searchbar.dart';
import 'package:trade_brain_1/view/home_screen/widgets/stock_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController controller = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.1),
          title: const Text(
            "TRADE BRAIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Column(
        children: [
          customSearchbar(controller.searchStock),
          Expanded(
            child: Obx(
              () {
                if (controller.stockList.isEmpty) {
                  return const Center(
                    child: Text(
                      "No data found",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return stockList(controller.stockList[index]);
                    },
                    itemCount: controller.stockList.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
