import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';

class DetailsSection extends StatelessWidget {
  final Map<String, dynamic> productsdetails;
  const DetailsSection({super.key, required this.productsdetails});

  @override
  Widget build(BuildContext context) {
    final firestore=FirebaseFirestore.instance;
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productsdetails['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "৳${productsdetails['discount_price'] ?? productsdetails['orginial_price']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  if (productsdetails['discount_price'] != null) ...[
                    const SizedBox(width: 10),
                    Text(
                      "৳${productsdetails['orginial_price']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.black12,
          ),
          const Text(
            "Product Description:",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            productsdetails['description'],
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
