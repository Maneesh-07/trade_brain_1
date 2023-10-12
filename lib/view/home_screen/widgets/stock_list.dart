import 'package:flutter/material.dart';
import 'package:trade_brain_1/db%20%20functions/db_function.dart';
import 'package:trade_brain_1/model/stock/best_match.dart';

Container stockList(StockListResult stocklist) {
  return Container(
    height: 65,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0.5),
    decoration: const BoxDecoration(color: Color.fromARGB(255, 46, 46, 46)),
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
                stocklist.symbol!,
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                stocklist.name!,
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    height: 1.3,
                    color: Color.fromARGB(255, 209, 209, 209),
                    fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
            width: 80,
            child: Text(stocklist.matchscore!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16))),
        InkWell(
          onTap: () {
            addStocksData(
                stocklist.symbol!, stocklist.name!, stocklist.matchscore!);
          },
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.green,
          ),
        ),
      ],
    ),
  );
}
