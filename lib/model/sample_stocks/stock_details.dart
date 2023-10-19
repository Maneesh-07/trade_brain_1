// To parse this JSON data, do
//
//     final stockDetails1 = stockDetails1FromJson(jsonString);

import 'dart:convert';

List<StockDetails1> stockDetails1FromJson(String str) => List<StockDetails1>.from(json.decode(str).map((x) => StockDetails1.fromJson(x)));

String stockDetails1ToJson(List<StockDetails1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockDetails1 {
    String type;
    String symbol;
    String company;

    StockDetails1({
        required this.type,
        required this.symbol,
        required this.company,
    });

    factory StockDetails1.fromJson(Map<String, dynamic> json) => StockDetails1(
        type: json["type"],
        symbol: json["symbol"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "symbol": symbol,
        "company": company,
    };
    
  static List<StockDetails1> everyoneFromSnapshot(
      List<dynamic> everyoneSnapshot) {
    return everyoneSnapshot
        .map((jsonData) => StockDetails1.fromJson(jsonData))
        .toList();
  }
}
