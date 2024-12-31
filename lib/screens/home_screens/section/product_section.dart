import 'package:e_commarce_app_firebase/screens/product_details/product_details.dart';
import 'package:e_commarce_app_firebase/widgets/price_and_discountprice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => const ProductDetails());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/024/841/285/small_2x/wireless-headphone-isolated-on-transparent-background-high-quality-bluetooth-headphone-for-advertising-and-product-catalogs-generative-ai-png.png",
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Wireless Bluethood Headphone",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const PriceAndDiscountPrice(
                    price: 40.25,
                    afterdiscount: 35,
                    percentiseoff: 15,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Text(
                        "4.4",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(412)",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
