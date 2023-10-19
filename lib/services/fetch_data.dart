import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:trade_brain_1/model/sample_stocks/stock_details.dart';
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
   
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final quoteData = data['Global Quote'];
      return StockDetails.fromJson(quoteData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  
  Future<StockDetails1?> getStockDetails() async {
    final apiUrl =
        'https://dev.portal.tradebrains.in/api/search?keyword=Reliance';

    final response = await http.get(Uri.parse(apiUrl));
   
    if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
      // final quoteData = data['Global Quote'];
      // return StockDetails.fromJson(quoteData);
      log(data.toString());
      return StockDetails1.fromJson(data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class ApihandlerForEveryone {
  static Future<List<StockDetails1>> fetchEveryOneMovies() async {
    const url =
        'https://dev.portal.tradebrains.in/api/search?keyword=Reliance';

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)) {
        tempList.add(v);
      }
    }
    return StockDetails1.everyoneFromSnapshot(tempList);
  }
}
