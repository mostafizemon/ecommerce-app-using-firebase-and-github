import 'package:flutter/material.dart';

class CustomSearchbox extends StatelessWidget {
  const CustomSearchbox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "Search Anything...",
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
