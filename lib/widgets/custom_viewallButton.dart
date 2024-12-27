import 'package:flutter/material.dart';

class CustomViewallbutton extends StatelessWidget {
  String title;
  CustomViewallbutton({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "View All",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey
          ),
        ),
      ],
    );
  }
}
