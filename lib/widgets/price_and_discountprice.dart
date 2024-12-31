import 'package:flutter/material.dart';

class PriceAndDiscountPrice extends StatelessWidget {
  final double price;
  final double? afterdiscount;
  final int? percentiseoff;

  const PriceAndDiscountPrice({
    super.key,
    required this.price,
    this.afterdiscount,
    this.percentiseoff,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$$afterdiscount",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        if (afterdiscount != null) ...[
          const SizedBox(width: 10),
          Text(
            "\$$price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
        if (percentiseoff != null) ...[
          const SizedBox(width: 5),
          Text(
            "$percentiseoff% OFF",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ],
      ],
    );
  }
}
