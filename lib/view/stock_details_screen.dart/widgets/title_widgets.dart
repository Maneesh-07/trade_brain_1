import 'package:flutter/material.dart';

Text titleWidget(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

Text titleWidget2(String title) {
  return Text(
    title,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
  );
}
