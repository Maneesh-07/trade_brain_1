import 'package:get/get.dart';
import 'package:trade_brain_1/model/stock_details/stock_detail.dart';
import 'package:trade_brain_1/services/fetch_data.dart';

class StockDetailsController extends GetxController {
  final FetchStockApi fetchStockApi = FetchStockApi();
  final stockDetails = Rx<StockDetails?>(null);

  Future<void> fetchStockDetails(String symbol) async {
    try {
      final result = await fetchStockApi.fetchStockDetails(symbol);
      stockDetails.value = result;
    } catch (e) {
      print('Error fetching stock details: $e');
    }
  }
}
