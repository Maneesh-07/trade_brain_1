import 'package:flutter/material.dart';

Widget customSearchbar(void Function(String value) serach) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 23, 23, 23),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            onChanged: (value) => serach(value),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Search stock",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
