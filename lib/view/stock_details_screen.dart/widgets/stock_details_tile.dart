import 'package:flutter/material.dart';
import 'package:trade_brain_1/model/stock_details/stock_detail.dart';
import 'package:trade_brain_1/view/stock_details_screen.dart/widgets/title_widgets.dart';

Container stockDetailsTile(StockDetails stockDetails, stocklist) {
  return Container(
    height: 400,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100,
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                stocklist["symbol"],
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                stocklist["name"],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 2,
                color: Colors.white,
              )
            ],
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    titleWidget("Price"),
                    titleWidget("Low"),
                    titleWidget("High"),
                    titleWidget("Volume"),
                    titleWidget("change"),
                    titleWidget("change percent"),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    titleWidget2(": ${stockDetails.price}"),
                    titleWidget2(": ${stockDetails.low}"),
                    titleWidget2(": ${stockDetails.high}"),
                    titleWidget2(": ${stockDetails.volume}"),
                    titleWidget2(": ${stockDetails.change}"),
                    titleWidget2(": ${stockDetails.changePercent}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
