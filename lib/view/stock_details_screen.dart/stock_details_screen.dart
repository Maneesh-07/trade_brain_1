import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain_1/controller/stock_details_controller.dart';
import 'package:trade_brain_1/view/stock_details_screen.dart/widgets/stock_details_tile.dart';

class StockDetailsScreen extends StatelessWidget {
  StockDetailsScreen({Key? key, required this.stocklist}) : super(key: key);

  final stocklist;
  final StockDetailsController controller = Get.put(StockDetailsController());

  @override
  Widget build(BuildContext context) {
    controller.fetchStockDetails(stocklist["symbol"]);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Stock Details'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.stockDetails.value == null) {
            return const CircularProgressIndicator();
          } else {
            final stockDetails = controller.stockDetails.value!;
            return stockDetailsTile(stockDetails, stocklist);
          }
        }),
      ),
    );
  }
}
