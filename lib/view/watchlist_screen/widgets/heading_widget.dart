import 'package:flutter/material.dart';

Container dividerWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.5),
    height: 2,
    color: Colors.grey,
  );
}

Container headingWidget() {
  return Container(
    margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          width: 230,
          child: const Text(
            'Company',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Text(
          'Matchscore',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    ),
  );
}
