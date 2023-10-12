import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;
Future<void> initDatabase() async {
  _db = await openDatabase(
    "stocks.db",
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE stock(symbol TEXT PRIMARY KEY,name TEXT,matchscore TEXT )");
    },
  );
}

Future<List<Map<String, dynamic>>> getStocksData() async {
  final values = await _db.rawQuery("SELECT * FROM stock");
  log(values.toString());
  return values;
}

Future<void> addStocksData(
    String symbol, String name, String matchscore) async {
  final existingData = await _db.rawQuery(
    "SELECT COUNT(*) FROM stock WHERE symbol = ?",
    [symbol],
  );

  final count = Sqflite.firstIntValue(existingData);

  if (count == 0) {
    await _db.rawInsert(
      "INSERT INTO stock(symbol,name,matchscore) VALUES(?,?,?)",
      [symbol, name, matchscore],
    );
    Fluttertoast.showToast(
        msg: "Added to watchlist",
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black);
  } else {
    Fluttertoast.showToast(
        msg: "Already added",
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black);
  }
}

Future<void> deleteStocksData(String symbol) async {
  _db.rawInsert(
    "DELETE FROM stock WHERE symbol = ?",
    [symbol],
  );
  Fluttertoast.showToast(
    msg: "$symbol removed from watchlist",
    textColor: Colors.black,
    backgroundColor: Colors.redAccent,
  );
}
