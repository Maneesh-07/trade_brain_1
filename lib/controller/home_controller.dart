import 'package:get/get.dart';
import 'package:trade_brain_1/model/stock/best_match.dart';
import 'package:trade_brain_1/services/fetch_data.dart';

class homeController extends GetxController {
  final FetchStockApi stockApi = FetchStockApi();
  RxList<StockListResult> stockList = <StockListResult>[].obs;

  void searchStock(String keywords) async {
    final results = await stockApi.searchStock(keywords);
    stockList.assignAll(results);
  }
}
