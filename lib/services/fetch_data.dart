import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:trade_brain_1/model/stock/best_match.dart';
import 'package:trade_brain_1/model/stock_details/stock_detail.dart';

class FetchStockApi {
  static const String apiKey = 'D6NS6GHT165QI8SU';
  static const String baseUrl = "https://www.alphavantage.co";
  int value = 0;
  Future<List<StockListResult>> searchStock(String keywords) async {
    value++;
    log("apicalled $value");
    final response = await http.get(Uri.parse(
        "$baseUrl/query?function=SYMBOL_SEARCH&keywords=$keywords&apikey=$apiKey"));
    // final response = await http.get(Uri.parse(
    //     "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tencent&apikey=demo"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["bestMatches"] != null) {
        final stockListData = data["bestMatches"] as List<dynamic>;
        print(stockListData);
        return stockListData.map((e) => StockListResult.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<StockDetails> fetchStockDetails(String symbol) async {
    final apiUrl =
        '$baseUrl/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    // final response = await http.get(Uri.parse(
    //     "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final quoteData = data['Global Quote'];
      return StockDetails.fromJson(quoteData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
