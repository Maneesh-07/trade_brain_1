import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain_1/controller/watchlist_controller.dart';
import 'package:trade_brain_1/view/watchlist_screen/widgets/appbar_watchlist.dart';
import 'package:trade_brain_1/view/watchlist_screen/widgets/heading_widget.dart';
import 'package:trade_brain_1/view/watchlist_screen/widgets/stocktile_watchlist.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key});
  final watchListController controller = Get.put(watchListController());

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Obx(() => controller.stocksData.isNotEmpty
          ? ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    headingWidget(),
                    dividerWidget(),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.stocksData.length,
                  itemBuilder: (context, index) {
                    final stock = controller.stocksData[index];
                    return stockListTile(stock, controller.fetchData, context);
                  },
                ),
              ],
            )
          : const Center(
              child: Text(
                "No records",
                style: TextStyle(color: Colors.white),
              ),
            )),
    );
  }
}
