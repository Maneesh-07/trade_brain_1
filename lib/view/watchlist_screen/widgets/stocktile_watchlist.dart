import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:trade_brain_1/db%20%20functions/db_function.dart';
import 'package:trade_brain_1/view/stock_details_screen.dart/stock_details_screen.dart';

Widget stockListTile(stocklist, fetchData, context) {
  return InkWell(
    onTap: () => Get.to(StockDetailsScreen(stocklist: stocklist)),
    child: Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 15, 15, 15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 5),
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stocklist['symbol'],
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                  child: Marquee(
                    text: stocklist['name'],
                    // textAlign: TextAlign.left,
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                        color: Color.fromARGB(255, 209, 209, 209),
                        fontSize: 15),
                    scrollAxis: Axis.horizontal,
                    textDirection: TextDirection.ltr,
                    blankSpace: 50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: 80,
              child: Text(stocklist['matchscore'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ))),
          InkWell(
            onTap: () {
              deleteStocksData(stocklist["symbol"]);
              fetchData();
            },
            child: const Icon(
              Icons.clear,
              size: 35,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    ),
  );
}
