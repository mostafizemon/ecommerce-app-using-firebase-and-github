import 'package:e_commarce_app_firebase/screens/product_details/section/details_section.dart';
import 'package:e_commarce_app_firebase/screens/product_details/section/product_slider_section.dart';
import 'package:flutter/Material.dart';

import '../../widgets/toproundedcontainer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSliderSection(),
            DetailsSection(),
          ],
        ),
      ),


      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFF7643),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(100, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () {},
                child: const Text("Add To Cart"),
              )),
        ),
      ),


    );
  }
}
